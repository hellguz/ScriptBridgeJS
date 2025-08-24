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
using System.Text;
using System.Text.Json;
using Grasshopper.Kernel;
using Rhino.Geometry;

public class Script_Instance : GH_ScriptInstance
{
	private void RunScript(ref object A)
	{
		var doc = this.Component.OnPingDocument();
		if (doc == null) { AddRuntimeMessage(GH_RuntimeMessageLevel.Warning, "Cannot access the Grasshopper document."); return; }

		var definition = new CompactGhDefinition();
		var docObjects = doc.Objects.ToList();
		var guidToIndexMap = docObjects.Select((obj, i) => new { obj.InstanceGuid, i }).ToDictionary(x => x.InstanceGuid, x => x.i);

		for (int i = 0; i < docObjects.Count; i++)
		{
			var obj = docObjects[i];
			var myComponent = new CompactGhComponent { Id = i };

			if (obj is IGH_Component ghComponent)
			{
				myComponent.Name = ghComponent.Name;
				myComponent.NickName = ghComponent.NickName;
				myComponent.Description = ghComponent.Description;
				myComponent.IsComponent = true;
				foreach (var inputParam in ghComponent.Params.Input)
				{
					myComponent.InputParams.Add(new CompactGhParameter { NickName = inputParam.NickName, TypeName = inputParam.TypeName });
					var connections = new List<int[]>();
					foreach (var source in inputParam.Sources)
					{
						var sourceOwnerObj = source.Attributes.GetTopLevel.DocObject;
						if (sourceOwnerObj != null && guidToIndexMap.TryGetValue(sourceOwnerObj.InstanceGuid, out int sourceId))
						{
							int sourceParamIndex = (sourceOwnerObj is IGH_Component sourceComp) ? sourceComp.Params.Output.IndexOf(source) : 0;
							if(sourceParamIndex > -1) connections.Add(new int[] { sourceId, sourceParamIndex });
						}
					}
					myComponent.Inputs.Add(connections);
				}
				myComponent.Outputs = ghComponent.Params.Output.Select(p => new CompactGhParameter { NickName = p.NickName, TypeName = p.TypeName }).ToList();
			}
			else if (obj is IGH_Param ghParam)
			{
				myComponent.Name = ghParam.Name;
				myComponent.NickName = ghParam.NickName;
				myComponent.Description = ghParam.Description;
				myComponent.IsComponent = false;
				myComponent.Outputs.Add(new CompactGhParameter { NickName = ghParam.NickName, TypeName = ghParam.TypeName });
				if (ghParam.Sources.Any())
				{
					myComponent.InputParams.Add(new CompactGhParameter { NickName = "Input", TypeName = ghParam.TypeName });
					var connections = new List<int[]>();
					foreach(var source in ghParam.Sources)
					{
						var sourceOwnerObj = source.Attributes.GetTopLevel.DocObject;
						if (sourceOwnerObj != null && guidToIndexMap.TryGetValue(sourceOwnerObj.InstanceGuid, out int sourceId))
						{
							int sourceParamIndex = (sourceOwnerObj is IGH_Component sourceComp) ? sourceComp.Params.Output.IndexOf(source) : 0;
							if(sourceParamIndex > -1) connections.Add(new int[] { sourceId, sourceParamIndex });
						}
					}
					myComponent.Inputs.Add(connections);
				}
			}
			definition.Components.Add(myComponent);
		}

		// Serialize with standard indentation first.
		string indentedJson = JsonSerializer.Serialize(definition, new JsonSerializerOptions { WriteIndented = true });

		// Post-process the string to replace 2-space indents with 1-space indents.
		var lines = indentedJson.Split(new[] { Environment.NewLine }, StringSplitOptions.None);
		var resultBuilder = new StringBuilder();
		foreach (var line in lines)
		{
			var trimmedLine = line.TrimStart();
			// Default indent is 2 spaces, so we divide by 2 to get the nesting level.
			int indentLevel = (line.Length - trimmedLine.Length) / 2;
			resultBuilder.Append(new string(' ', indentLevel));
			resultBuilder.AppendLine(trimmedLine);
		}

		// Assign the re-formatted string to the output.
		A = resultBuilder.ToString().TrimEnd();
	}

	// <Custom additional code>
	public class CompactGhDefinition { public List<CompactGhComponent> Components { get; set; } = new List<CompactGhComponent>(); }
	public class CompactGhParameter { public string NickName { get; set; } public string TypeName { get; set; } }
	public class CompactGhComponent
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string NickName { get; set; }
		public string Description { get; set; }
		public bool IsComponent { get; set; }
		public List<List<int[]>> Inputs { get; set; } = new List<List<int[]>>();
		public List<CompactGhParameter> InputParams { get; set; } = new List<CompactGhParameter>();
		public List<CompactGhParameter> Outputs { get; set; } = new List<CompactGhParameter>();
	}
	// </Custom additional code>
}
