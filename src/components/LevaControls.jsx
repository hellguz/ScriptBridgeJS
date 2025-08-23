import { useControls, folder } from 'leva'
import { useEffect, useRef } from 'react'

function LevaControls({ parsedScript, onParametersChange, onVisibilityChange, externalParameters }) {
  const previousExternalParams = useRef({})
  const isUpdatingFromExternal = useRef(false)
  
  // Generate Leva schema from parsed inputs
  const schema = {}
  const folders = {}

  // Add input parameters, skipping interactive ones
  parsedScript.inputs.forEach(input => {
    const { name, type, metadata = {}, folder: folderName } = input
    
    // CRITICAL FIX: Skip creating Leva controls for interactive parameters,
    // as they are handled by the GizmoController in the 3D viewport.
    if (metadata.interactive) {
      return; // Skips to the next input
    }
    
    const currentValue = externalParameters?.[name] !== undefined ? externalParameters[name] : metadata.default
    let control = {};

    switch (type) {
      case 'number':
        control = {
          value: currentValue !== undefined ? currentValue : 0,
          min: metadata.min !== undefined ? metadata.min : 0,
          max: metadata.max !== undefined ? metadata.max : 10,
          step: metadata.step !== undefined ? metadata.step : 0.1
        };
        break
        
      case 'string':
        control = { value: currentValue !== undefined ? currentValue : '' };
        break
        
      case 'boolean':
        control = { value: currentValue !== undefined ? currentValue : false };
        break
        
      // Note: 'number[]' and 'Array<number[]>' are intentionally omitted
      // because they are handled by the interactive check above.
        
      default:
        return; // Skip unknown types
    }

    if (folderName) {
        if (!folders[folderName]) folders[folderName] = {};
        folders[folderName][name] = control;
    } else {
        schema[name] = control;
    }
  })

  // Group controls into folders
  for (const folderName in folders) {
      schema[folderName] = folder(folders[folderName]);
  }
  
  // Add output visibility toggles
  if (parsedScript.outputs && parsedScript.outputs.length > 0) {
    const visibilityControls = {};
    parsedScript.outputs.forEach(output => {
      visibilityControls[`Show ${output.name || 'output'}`] = true
    })
    schema['Visibility'] = folder(visibilityControls);
  }
  
  const [values, set] = useControls(parsedScript.functionName, () => schema, [parsedScript.functionName]);
  
  // Sync external parameter changes (from gizmos) to Leva
  useEffect(() => {
    if (!externalParameters) return
    
    Object.entries(externalParameters).forEach(([paramName, paramValue]) => {
      // Only update if the parameter exists in the schema (i.e., is not interactive)
      if (schema[paramName] || Object.values(folders).some(f => f[paramName])) {
        const prevValue = previousExternalParams.current[paramName]
        if (JSON.stringify(prevValue) !== JSON.stringify(paramValue)) {
          isUpdatingFromExternal.current = true
          set({ [paramName]: paramValue })
        }
      }
    })
    
    previousExternalParams.current = { ...externalParameters }
  }, [externalParameters, set, schema, folders])

  // Update parent component when Leva values change
  useEffect(() => {
    if (isUpdatingFromExternal.current) {
      isUpdatingFromExternal.current = false
      return
    }
    
    const parameters = {}
    const visibility = {}
    
    Object.entries(values).forEach(([key, value]) => {
      if (key.startsWith('Show ')) {
        visibility[key] = value
      } else {
        parameters[key] = value
      }
    })
    
    onParametersChange(parameters)
    onVisibilityChange(visibility)

  }, [values, onParametersChange, onVisibilityChange])

  return null // Leva renders its own UI
}

export default LevaControls
