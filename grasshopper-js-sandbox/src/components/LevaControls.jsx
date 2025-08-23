import { useControls } from 'leva'
import { useEffect } from 'react'

function LevaControls({ parsedScript, onParametersChange, onVisibilityChange }) {
  // Generate Leva schema from parsed inputs
  const schema = {}
  
  // Add input parameters
  parsedScript.inputs.forEach(input => {
    const { name, type, metadata = {} } = input
    
    switch (type) {
      case 'number':
        schema[name] = {
          value: metadata.default || 0,
          min: metadata.min || 0,
          max: metadata.max || 10,
          step: metadata.step || 0.1
        }
        break
        
      case 'string':
        schema[name] = metadata.default || ''
        break
        
      case 'boolean':
        schema[name] = metadata.default || false
        break
        
      case 'number[]':
        // Handle array parameters (like position)
        const defaultArray = metadata.default || [0, 0, 0]
        if (defaultArray.length === 3) {
          schema[name] = {
            value: defaultArray,
            step: metadata.step || 0.1
          }
        }
        break
        
      default:
        // Fallback for unknown types
        schema[name] = metadata.default || ''
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
  const values = useControls(parsedScript.functionName, schema)
  
  // console.log('LevaControls - values:', values)

  // Update parent component when values change
  useEffect(() => {
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
      
      // console.log('LevaControls - sending parameters:', parameters)
      // console.log('LevaControls - sending visibility:', visibility)
      
      onParametersChange(parameters)
      if (onVisibilityChange) {
        onVisibilityChange(visibility)
      }
    }
  }, [values, onParametersChange, onVisibilityChange])

  return null // Leva renders its own UI
}

export default LevaControls