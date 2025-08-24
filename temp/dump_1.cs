/*
 * HOW TO USE THIS SCRIPT:
 * 1. Open Grasshopper in Rhino 8.
 * 2. Add a "C# Script" component to your canvas (found under Math > Script).
 * 3. Zoom in on the C# component until a black bar with "..." appears. Click it to open the script editor.
 * 4. In the script editor, replace all the existing code with the code below.
 * 5. Click "OK" to compile and close the editor.
 * 6. The component will have one output, 'A', which will contain the compact JSON string
 * representing the entire Grasshopper definition.
 * 7. Connect a "Panel" component to the 'A' output to view the JSON.
 *
 * This script requires no inputs. It automatically analyzes the document it belongs to.
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using Grasshopper.Kernel;
using Rhino.Geometry;

public class Script_Instance : GH_ScriptInstance
{
  private void RunScript(ref object A)
  {
    // Attempt to get the current Grasshopper document.
    var doc = this.Component.OnPingDocument();
    if (doc == null)
    {
      AddRuntimeMessage(GH_RuntimeMessageLevel.Warning, "Cannot access the Grasshopper document.");
      return;
    }

    var definition = new CompactGhDefinition();
    var docObjects = doc.Objects.ToList(); // Get a stable list of all objects.

    // First Pass: Create a map from component GUIDs to integer indices for stable referencing.
    var guidToIndexMap = new Dictionary<Guid, int>();
    for (int i = 0; i < docObjects.Count; i++)
    {
      guidToIndexMap[docObjects[i].InstanceGuid] = i;
    }

    // Second Pass: Process each object to build the compact representation.
    for (int i = 0; i < docObjects.Count; i++)
    {
      var obj = docObjects[i];
      var myComponent = new CompactGhComponent { Id = i };

      // Case 1: The object is a standard component (e.g., "Addition", "Extrude").
      if (obj is IGH_Component ghComponent)
      {
        myComponent.Name = ghComponent.Name;
        myComponent.NickName = ghComponent.NickName;
        myComponent.Description = ghComponent.Description;
        myComponent.IsComponent = true;

        // Process all input parameters for the component.
        foreach (var inputParam in ghComponent.Params.Input)
        {
          var connections = new List<int[]>();
          foreach (var source in inputParam.Sources)
          {
            var sourceOwnerObj = source.Attributes.GetTopLevel.DocObject;
            if (sourceOwnerObj != null && guidToIndexMap.ContainsKey(sourceOwnerObj.InstanceGuid))
            {
              int sourceComponentId = guidToIndexMap[sourceOwnerObj.InstanceGuid];
              int sourceParamIndex = 0; // Default for floating params.

              // If the source is a full component, find the specific output index.
              if (sourceOwnerObj is IGH_Component sourceOwnerComponent)
              {
                sourceParamIndex = sourceOwnerComponent.Params.Output.IndexOf(source);
              }
              // For floating params, the output index is implicitly 0.

              if(sourceParamIndex > -1)
              {
                connections.Add(new int[] { sourceComponentId, sourceParamIndex });
              }
            }
          }
          myComponent.Inputs.Add(connections);
        }

        // Process all output parameters.
        myComponent.OutputNames = ghComponent.Params.Output.Select(p => p.NickName).ToList();
      }
      // Case 2: The object is a floating parameter (e.g., a Number Slider, Panel, etc.).
      else if (obj is IGH_Param ghParam)
      {
        myComponent.Name = ghParam.Name;
        myComponent.NickName = ghParam.NickName;
        myComponent.Description = ghParam.Description;
        myComponent.IsComponent = false;

        // A floating parameter has one implicit output, which is itself.
        myComponent.OutputNames.Add(ghParam.NickName);

        // Check for incoming connections (e.g., from wireless senders).
        if (ghParam.Sources.Any())
        {
          var connections = new List<int[]>();
          foreach(var source in ghParam.Sources)
          {
            var sourceOwnerObj = source.Attributes.GetTopLevel.DocObject;
            if (sourceOwnerObj != null && guidToIndexMap.ContainsKey(sourceOwnerObj.InstanceGuid))
            {
              int sourceComponentId = guidToIndexMap[sourceOwnerObj.InstanceGuid];
              int sourceParamIndex = 0; // Default for floating params

              if (sourceOwnerObj is IGH_Component sourceOwnerComponent)
              {
                sourceParamIndex = sourceOwnerComponent.Params.Output.IndexOf(source);
              }
              if(sourceParamIndex > -1)
              {
                connections.Add(new int[] { sourceComponentId, sourceParamIndex });
              }
            }
          }
          myComponent.Inputs.Add(connections);
        }
      }
      definition.Components.Add(myComponent);
    }

    // Configure JSON serialization options for clean, readable output.
    var options = new JsonSerializerOptions { WriteIndented = true };
    string jsonString = JsonSerializer.Serialize(definition, options);

    // Assign the final JSON string to the component's output.
    A = jsonString;
  }

  // <Custom additional code>
  // Define the compact data structures that will be serialized into JSON.

  /// <summary>
  /// Represents the entire Grasshopper definition.
  /// </summary>
  public class CompactGhDefinition
  {
    public List<CompactGhComponent> Components { get; set; } = new List<CompactGhComponent>();
  }

  /// <summary>
  /// Represents a single object on the canvas in a compact format.
  /// </summary>
  public class CompactGhComponent
  {
    public int Id { get; set; }
    public string Name { get; set; }
    public string NickName { get; set; }
    public string Description { get; set; }
    public bool IsComponent { get; set; }
    // Each inner list represents an input parameter.
    // Each int[] represents a connection as [source_component_id, source_output_id].
    public List<List<int[]>> Inputs { get; set; } = new List<List<int[]>>();
    public List<string> OutputNames { get; set; } = new List<string>();
  }
  // </Custom additional code>
}
