/*
 * HOW TO USE THIS SCRIPT:
 * 1. Open Grasshopper in Rhino 8.
 * 2. Add a "C# Script" component to your canvas (found under Math > Script).
 * 3. Zoom in on the C# component until a black bar with "..." appears. Click it to open the script editor.
 * 4. In the script editor, replace all the existing code with the code below.
 * 5. Click "OK" to compile and close the editor.
 * 6. The component will have one output, 'A', which will contain the JSON string
 * representing the entire Grasshopper definition.
 * 7. Connect a "Panel" component to the 'A' output to view the JSON.
 *
 * This script requires no inputs. It automatically analyzes the document it belongs to.
 */

using System;
using System.Collections.Generic;
using System.Text.Json;
using Grasshopper.Kernel;
using Rhino.Geometry;

public class Script_Instance : GH_ScriptInstance
{
  private void RunScript(ref object A)
  {
    // Attempt to get the current Grasshopper document.
    // FIX 1: Access OnPingDocument() via the parent Component.
    var doc = this.Component.OnPingDocument();
    if (doc == null)
    {
      AddRuntimeMessage(GH_RuntimeMessageLevel.Warning, "Cannot access the Grasshopper document.");
      return;
    }

    var definition = new GhDefinition();

    // Iterate over every object on the canvas (components, sliders, panels, etc.).
    foreach (var obj in doc.Objects)
    {
      // Case 1: The object is a standard component (e.g., "Addition", "Extrude").
      if (obj is IGH_Component ghComponent)
      {
        var myComponent = new GhComponent
        {
          Uuid = ghComponent.InstanceGuid,
          Name = ghComponent.Name,
          NickName = ghComponent.NickName,
          Description = ghComponent.Description,
          IsComponent = true
        };

        // Process all input parameters for the component.
        foreach (var inputParam in ghComponent.Params.Input)
        {
          var myInput = new GhParameter
          {
            Uuid = inputParam.InstanceGuid,
            Name = inputParam.Name,
            NickName = inputParam.NickName,
            TypeName = inputParam.TypeName
          };

          // Find all sources connected to this input.
          foreach (var source in inputParam.Sources)
          {
            // FIX 2: Get the owner via Attributes, which is more reliable than the .Owner property.
            var sourceOwner = source.Attributes.GetTopLevel.DocObject as IGH_DocumentObject;
            if (sourceOwner != null)
            {
              myInput.Sources.Add(new GhConnection
              {
                SourceComponentUuid = sourceOwner.InstanceGuid,
                SourceParamUuid = source.InstanceGuid
              });
            }
          }
          myComponent.Inputs.Add(myInput);
        }

        // Process all output parameters for the component.
        foreach (var outputParam in ghComponent.Params.Output)
        {
          var myOutput = new GhParameter
          {
            Uuid = outputParam.InstanceGuid,
            Name = outputParam.Name,
            NickName = outputParam.NickName,
            TypeName = outputParam.TypeName
            // The 'Sources' list remains empty for outputs.
          };
          myComponent.Outputs.Add(myOutput);
        }
        definition.Components.Add(myComponent);
      }
      // Case 2: The object is a floating parameter (e.g., a Number Slider, Panel, etc.).
      else if (obj is IGH_Param ghParam)
      {
        // We treat floating parameters as components with one output and a special input
        // to show their own connections.
        var floatingParamAsComponent = new GhComponent
        {
          Uuid = ghParam.InstanceGuid,
          Name = ghParam.Name,
          NickName = ghParam.NickName,
          Description = ghParam.Description,
          IsComponent = false // Mark this as a floating parameter.
        };

        // The single "output" of a floating parameter is the parameter itself.
        floatingParamAsComponent.Outputs.Add(new GhParameter
        {
          Uuid = ghParam.InstanceGuid,
          Name = ghParam.Name,
          NickName = ghParam.NickName,
          TypeName = ghParam.TypeName
        });

        // If the floating parameter is receiving input (e.g., from a wireless connection),
        // we represent this with a single, conceptual "Input" parameter.
        if (ghParam.Sources.Count > 0)
        {
          var inputForFloatingParam = new GhParameter
          {
            Uuid = ghParam.InstanceGuid, // Re-use the GUID for its conceptual input.
            Name = "Input",
            NickName = "Input",
            TypeName = ghParam.TypeName
          };

          foreach (var source in ghParam.Sources)
          {
            // FIX 2 (Applied here as well): Get the owner via Attributes.
            var sourceOwner = source.Attributes.GetTopLevel.DocObject as IGH_DocumentObject;
            if (sourceOwner != null)
            {
              inputForFloatingParam.Sources.Add(new GhConnection
              {
                SourceComponentUuid = sourceOwner.InstanceGuid,
                SourceParamUuid = source.InstanceGuid
              });
            }
          }
          floatingParamAsComponent.Inputs.Add(inputForFloatingParam);
        }

        definition.Components.Add(floatingParamAsComponent);
      }
    }

    // Configure JSON serialization options for clean, readable output.
    var options = new JsonSerializerOptions
    {
      WriteIndented = true
    };

    // Serialize the collected data into a JSON string.
    string jsonString = JsonSerializer.Serialize(definition, options);

    // Assign the final JSON string to the component's output.
    A = jsonString;
  }

  // <Custom additional code>
  // Define the data structures that will be serialized into JSON.
  // These classes represent the hierarchical structure of a Grasshopper definition.

  /// <summary>
  /// Represents the entire Grasshopper definition, containing a list of all components.
  /// </summary>
  public class GhDefinition
  {
    public List<GhComponent> Components { get; set; } = new List<GhComponent>();
  }

  /// <summary>
  /// Represents a single object on the canvas, which can be a standard component
  /// or a floating parameter (like a slider or panel).
  /// </summary>
  public class GhComponent
  {
    public Guid Uuid { get; set; }
    public string Name { get; set; }
    public string NickName { get; set; }
    public string Description { get; set; }
    public bool IsComponent { get; set; } // True for multi-param components, false for floating params.
    public List<GhParameter> Inputs { get; set; } = new List<GhParameter>();
    public List<GhParameter> Outputs { get; set; } = new List<GhParameter>();
  }

  /// <summary>
  /// Represents an input or output parameter of a component.
  /// </summary>
  public class GhParameter
  {
    public Guid Uuid { get; set; }
    public string Name { get; set; }
    public string NickName { get; set; }
    public string TypeName { get; set; }
    public List<GhConnection> Sources { get; set; } = new List<GhConnection>();
  }

  /// <summary>
  /// Represents a connection from a source parameter to an input parameter.
  /// </summary>
  public class GhConnection
  {
    public Guid SourceComponentUuid { get; set; }
    public Guid SourceParamUuid { get; set; }
  }
  // </Custom additional code>
}
