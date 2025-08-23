import { useControls } from 'leva'
import { useEffect, useRef } from 'react'

function LevaControls({ parsedScript, onParametersChange, onVisibilityChange, externalParameters }) {
  const previousExternalParams = useRef({})
  const isUpdatingFromExternal = useRef(false)
  
  // Generate Leva schema from parsed inputs
  const schema = {}
  
  // Add input parameters
  parsedScript.inputs.forEach(input => {
    const { name, type, metadata = {} } = input
    
    // Use external parameter if available, otherwise JSDoc default
    const currentValue = externalParameters?.[name] !== undefined ? externalParameters[name] : metadata.default
    
    switch (type) {
      case 'number':
        schema[name] = {
          value: currentValue !== undefined ? currentValue : 0,
          min: metadata.min !== undefined ? metadata.min : 0,
          max: metadata.max !== undefined ? metadata.max : 10,
          step: metadata.step !== undefined ? metadata.step : 0.1
        }
        break
        
      case 'string':
        schema[name] = currentValue !== undefined ? currentValue : ''
        break
        
      case 'boolean':
        schema[name] = currentValue !== undefined ? currentValue : false
        break
        
      case 'number[]':
        // Handle array parameters (like position)
        const defaultArray = currentValue !== undefined ? currentValue : (metadata.default || [0, 0, 0])
        if (Array.isArray(defaultArray) && defaultArray.length === 3) {
          schema[name] = {
            value: defaultArray,
            step: metadata.step !== undefined ? metadata.step : 0.1
          }
        }
        break
        
      default:
        // Fallback for unknown types
        schema[name] = currentValue !== undefined ? currentValue : ''
    }
  })
  
  // Add output visibility toggles
  if (parsedScript.outputs && parsedScript.outputs.length > 0) {
    schema['--- Visibility ---'] = { value: '', disabled: true } // Separator
    parsedScript.outputs.forEach(output => {
      schema[`Show ${output.name || 'output'}`] = true
    })
  }
  
  // console.log('LevaControls - parsedScript:', parsedScript)
  // console.log('LevaControls - schema:', schema)
  
  // Use the function name as folder name  
  const [values, set] = useControls(parsedScript.functionName, () => schema)
  
  // console.log('LevaControls - values:', values)
  
  // Sync external parameter changes to Leva
  useEffect(() => {
    if (!externalParameters) return
    
    Object.entries(externalParameters).forEach(([paramName, paramValue]) => {
      const prevValue = previousExternalParams.current[paramName]
      if (JSON.stringify(prevValue) !== JSON.stringify(paramValue)) {
        console.log(`Syncing ${paramName} to Leva:`, paramValue)
        // Temporarily disable onChange callback to prevent loops
        isUpdatingFromExternal.current = true
        set({ [paramName]: paramValue })
      }
    })
    
    previousExternalParams.current = { ...externalParameters }
  }, [externalParameters, set])

  // Update parent component when values change
  useEffect(() => {
    // Prevent infinite loops when updating from external source
    if (isUpdatingFromExternal.current) {
      isUpdatingFromExternal.current = false
      return
    }
    
    if (onParametersChange) {
      // Separate parameters from visibility toggles
      const parameters = {}
      const visibility = {}
      
      Object.entries(values).forEach(([key, value]) => {
        if (key.startsWith('Show ')) {
          visibility[key] = value
        } else if (key !== '--- Visibility ---') {
          parameters[key] = value
        }
      })
      
      console.log('LevaControls - sending parameters from Leva:', parameters)
      
      onParametersChange(parameters)
      if (onVisibilityChange) {
        onVisibilityChange(visibility)
      }
    }
  }, [values, onParametersChange, onVisibilityChange])

  return null // Leva renders its own UI
}

export default LevaControls