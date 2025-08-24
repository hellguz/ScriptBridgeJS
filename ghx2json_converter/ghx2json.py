import xml.etree.ElementTree as ET
import json
import sys

def find_item_value(element, item_name):
    """
    Helper function to find the text value of a specific <item> by its name attribute.
    Searches all descendants of the given element.
    """
    if element is None:
        return None
    item = element.find(f".//item[@name='{item_name}']")
    return item.text if item is not None else None

def parse_ghx_to_compact_json(ghx_file_path):
    """
    Parses a Grasshopper .ghx file and converts it into a compact, indexed,
    and consistent bidirectional JSON graph format (adjacency list style).

    This format is optimized for LLM comprehension, size, and machine readability.

    Args:
        ghx_file_path (str): The path to the .ghx file.

    Returns:
        str: A JSON formatted string of the Grasshopper definition, or None if parsing fails.
    """
    try:
        tree = ET.parse(ghx_file_path)
        root = tree.getroot()
    except (ET.ParseError, FileNotFoundError) as e:
        print(f"Error reading or parsing file: {e}")
        return None

    components_list = []
    guid_to_index_map = {}
    param_guid_to_component_guid = {}
    param_guid_to_name = {}

    definition_objects = root.find(".//chunk[@name='DefinitionObjects']")
    if definition_objects is None:
        print("Could not find 'DefinitionObjects' chunk in the file.")
        return None

    all_objects = list(definition_objects.findall(".//chunk[@name='Object']"))
    
    # First pass: Discover components, assign indices, and map parameters
    for i, obj in enumerate(all_objects):
        container = obj.find("chunks/chunk[@name='Container']")
        if container is None:
            continue
        instance_guid = find_item_value(container, 'InstanceGuid')
        if not instance_guid:
            continue
        
        guid_to_index_map[instance_guid] = i
        
        component_info = {
            'id': instance_guid, # Temporary ID for lookups
            'nickname': find_item_value(container, 'NickName') or find_item_value(container, 'Name'),
            'name': find_item_value(container, 'Name'),
            'inputs': {},
            'outputs': {}, # MODIFICATION: Changed from list to dictionary
            'persistent_data': {}
        }
        
        param_chunks = [c for c in container.findall(".//chunk") if c.get('name', '').startswith('param_')]
        if not param_chunks:
            param_data_chunk = container.find(".//chunk[@name='ParameterData']")
            if param_data_chunk:
                param_chunks = param_data_chunk.findall("./chunk")

        for param in param_chunks:
            param_guid = find_item_value(param, 'InstanceGuid')
            if param_guid:
                param_guid_to_component_guid[param_guid] = instance_guid
                param_full_name = find_item_value(param, 'Name')
                param_guid_to_name[param_guid] = param_full_name
                
                param_name_attr = param.get('name', '')
                if 'output' in param_name_attr.lower():
                    # MODIFICATION: Initialize output param as a key with an empty list
                    component_info['outputs'][param_full_name] = []

        slider = container.find(".//chunk[@name='Slider']")
        if slider is not None:
            component_info['persistent_data']['slider_value'] = find_item_value(slider, 'Value')

        panel_text = find_item_value(container, 'UserText')
        if panel_text is not None and panel_text != 'Double click to edit panel content…':
             component_info['persistent_data']['panel_text'] = panel_text

        components_list.append(component_info)

    # Second pass: Process connections to build both input and output links
    for i, comp_info in enumerate(components_list):
        obj = all_objects[i]
        container = obj.find("chunks/chunk[@name='Container']")
        
        param_chunks = [c for c in container.findall(".//chunk") if c.get('name', '').startswith('param_input')]
        if not param_chunks:
            param_data_chunk = container.find(".//chunk[@name='ParameterData']")
            if param_data_chunk:
                param_chunks = [c for c in param_data_chunk.findall("./chunk") if c.get('name', '').startswith('InputParam')]
        
        for param in param_chunks:
            target_param_name = find_item_value(param, 'Name')
            sources = param.findall(".//item[@name='Source']")
            if sources:
                source_param_guid = sources[0].text
                if source_param_guid in param_guid_to_component_guid:
                    source_comp_guid = param_guid_to_component_guid[source_param_guid]
                    source_comp_index = guid_to_index_map.get(source_comp_guid)
                    source_param_name = param_guid_to_name.get(source_param_guid)
                    
                    if source_comp_index is not None:
                        # Add the input connection
                        # MODIFICATION: Store source param name instead of index
                        comp_info['inputs'][target_param_name] = {
                            "source_component": source_comp_index,
                            "source_param": source_param_name
                        }
                        
                        # Add the corresponding output connection to the source component
                        source_component_to_update = components_list[source_comp_index]
                        if source_param_name in source_component_to_update['outputs']:
                            source_component_to_update['outputs'][source_param_name].append({
                                "target_component": i,
                                "target_param": target_param_name
                            })

    # Finalization: Build the final dictionary and clean up temporary IDs
    components_dict = {}
    for i, comp_info in enumerate(components_list):
        final_comp_info = comp_info.copy()
        del final_comp_info['id']
        components_dict[i] = final_comp_info

    output_json = {
        'metadata': {
            'file_name': ghx_file_path
        },
        'components': components_dict
    }

    return json.dumps(output_json, indent=4)


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python ghx_converter_compact.py <path_to_ghx_file>")
        input_file = r'converter\scripts\buildings in plots.ghx'
        print(f"No file path provided. Using default '{input_file}'.")
    else:
        input_file = sys.argv[1]

    output_file = input_file.rsplit('.', 1)[0] + '.json'

    print(f"Converting '{input_file}' to compact JSON '{output_file}'...")
    
    json_output = parse_ghx_to_compact_json(input_file)

    if json_output:
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(json_output)
        print("Conversion successful!")
    else:
        print("Conversion failed.")
