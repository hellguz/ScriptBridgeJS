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
using Grasshopper.Kernel.Types;
using Rhino.Geometry;

public class Script_Instance : GH_ScriptInstance
{
	// Define character limits for data previews.
	private const int PREVIEW_CHAR_LIMIT = 20;
	private const int FULL_DATA_CHAR_LIMIT = 10000;

	/// <summary>
	/// Generates a descriptive string for a given data object (IGH_Goo).
	/// </summary>
	private string GetDataPreviewString(IGH_Goo goo)
	{
		if (goo == null) return "null";

		// Use pattern matching on the underlying data to provide more detail.
		switch (goo.ScriptVariable())
		{
			case Point3d pt:
				return $"Pt({pt.X:F2},{pt.Y:F2},{pt.Z:F2})";

			case Line line:
				return $"Line[({line.From.X:F2},{line.From.Y:F2},{line.From.Z:F2})->({line.To.X:F2},{line.To.Y:F2},{line.To.Z:F2})]";

			case Curve curve when curve.IsLinear():
				return $"Line[({curve.PointAtStart.X:F2},{curve.PointAtStart.Y:F2},{curve.PointAtStart.Z:F2})->({curve.PointAtEnd.X:F2},{curve.PointAtEnd.Y:F2},{curve.PointAtEnd.Z:F2})]";

			case Curve curve:
				var nurbsCurve = curve.ToNurbsCurve();
				if (nurbsCurve != null)
				{
					string pointsStr = string.Join(";", nurbsCurve.Points.Select(p => $"({p.Location.X:F2},{p.Location.Y:F2},{p.Location.Z:F2})"));
					return $"CurvePts[{pointsStr}]";
				}
				return $"Curve(L={curve.GetLength():F2})"; // Fallback

			case Brep brep:
				return $"Brep(V={brep.Vertices.Count},F={brep.Faces.Count})";

			default:
				return goo.ToString(); // Fallback to the default for other types.
		}
	}

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
					myComponent.Inputs.Add(new GhInputParameter { Name = inputParam.Name, TypeName = inputParam.TypeName, Connections = connections });
				}

				// A component is considered a "source" if it has no connected inputs.
				bool isSourceComponent = !ghComponent.Params.Input.Any(p => p.Sources.Any());
				myComponent.Outputs = ghComponent.Params.Output.Select(p => {
					bool isUnconnectedOutput = p.Recipients.Count == 0;
					bool showFullData = isSourceComponent || isUnconnectedOutput;

					var data = p.VolatileData.AllData(true);
					var sb = new StringBuilder();
					foreach (var goo in data)
					{
						if (sb.Length > 0) sb.Append(", ");
						sb.Append(GetDataPreviewString(goo));
						if (!showFullData && sb.Length > PREVIEW_CHAR_LIMIT)
						{
							sb.Length = PREVIEW_CHAR_LIMIT;
							sb.Append("...");
							break;
						}
					}
					string dataPreview = sb.ToString();
					if (showFullData && dataPreview.Length > FULL_DATA_CHAR_LIMIT)
					{
						dataPreview = dataPreview.Substring(0, FULL_DATA_CHAR_LIMIT) + "...";
					}

					return new GhOutputParameter { Name = p.Name, TypeName = p.TypeName, DataPreview = dataPreview };
				}).ToList();
			}
			else if (obj is IGH_Param ghParam)
			{
				myComponent.Name = ghParam.Name;
				myComponent.NickName = ghParam.NickName;
				myComponent.Description = ghParam.Description;
				myComponent.IsComponent = false;

				// A floating parameter is a "source" if it has no inputs. Its output is unconnected if it has no recipients.
				bool isSourceParam = ghParam.Sources.Count == 0;
				bool isUnconnectedOutput = ghParam.Recipients.Count == 0;
				bool showFullData = isSourceParam || isUnconnectedOutput;

				var data = ghParam.VolatileData.AllData(true);
				var sb = new StringBuilder();
				foreach (var goo in data)
				{
					if (sb.Length > 0) sb.Append(", ");
					sb.Append(GetDataPreviewString(goo));
					if (!showFullData && sb.Length > PREVIEW_CHAR_LIMIT)
					{
						sb.Length = PREVIEW_CHAR_LIMIT;
						sb.Append("...");
						break;
					}
				}
				string dataPreview = sb.ToString();
				if (showFullData && dataPreview.Length > FULL_DATA_CHAR_LIMIT)
				{
					dataPreview = dataPreview.Substring(0, FULL_DATA_CHAR_LIMIT) + "...";
				}

				myComponent.Outputs.Add(new GhOutputParameter { Name = ghParam.Name, TypeName = ghParam.TypeName, DataPreview = dataPreview });

				if (ghParam.Sources.Any())
				{
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
					myComponent.Inputs.Add(new GhInputParameter { Name = "Input", TypeName = ghParam.TypeName, Connections = connections });
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
	public class GhInputParameter { public string Name { get; set; } public string TypeName { get; set; } public List<int[]> Connections { get; set; } = new List<int[]>(); }
	public class GhOutputParameter { public string Name { get; set; } public string TypeName { get; set; } public string DataPreview { get; set; } }
	public class CompactGhComponent
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string NickName { get; set; }
		public string Description { get; set; }
		public bool IsComponent { get; set; }
		public List<GhInputParameter> Inputs { get; set; } = new List<GhInputParameter>();
		public List<GhOutputParameter> Outputs { get; set; } = new List<GhOutputParameter>();
	}
	// </Custom additional code>
}
