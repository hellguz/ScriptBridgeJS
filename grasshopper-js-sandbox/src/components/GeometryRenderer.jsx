import { useEffect, useState } from 'react'
import * as THREE from 'three'
import { createMaterialConfig, applyMaterialToObject, parseOutputStyling } from '../lib/materials.js'

function GeometryRenderer({ parsedScript, parameters = {}, visibility = {}, onExecutionError }) {
    const [geometries, setGeometries] = useState([])
    const [executionError, setExecutionError] = useState(null)

    useEffect(() => {
        if (!parsedScript) {
            setGeometries([])
            setExecutionError(null)
            return
        }

        try {
            // Execute the parsed function with current parameters
            const result = executeFunction(parsedScript, parameters)

            if (result) {
                let geoArray = []
                
                // Handle different return types
                if (Array.isArray(result)) {
                    // Array of geometries
                    geoArray = result
                } else if (result.isObject3D || result.isMesh || result.isGeometry || result.isBufferGeometry) {
                    // Single geometry object
                    geoArray = [result]
                } else if (typeof result === 'object' && result !== null) {
                    // Object with named properties (multiple outputs)
                    geoArray = Object.values(result)
                } else {
                    console.warn('Unexpected result type:', typeof result, result)
                    geoArray = [result]
                }
                
                const validGeometries = geoArray.filter(geo => {
                    const isValid = geo && (geo.isObject3D || geo.isMesh || geo.isGeometry || geo.isBufferGeometry)
                    if (geo && !isValid) {
                        console.warn('Invalid geometry object:', geo)
                    }
                    return isValid
                })
                setGeometries(validGeometries)
                setExecutionError(null)
                if (onExecutionError) {
                    onExecutionError(null)
                }
            } else {
                console.warn('Function returned null or undefined result')
                setGeometries([])
            }
        } catch (error) {
            console.error('Function execution error:', error)
            setExecutionError(error.message)
            setGeometries([])
            if (onExecutionError) {
                onExecutionError(error.message)
            }
        }
    }, [parsedScript, parameters])

    // Don't render anything if there's an execution error
    if (executionError) {
        return null
    }

    return (
        <>
            {geometries.map((geometry, index) => {
                // Check if this geometry should be visible
                const outputParam = parsedScript?.outputs?.[index]
                const outputName = outputParam?.name || `output${index}`
                const isVisible = visibility[`Show ${outputName}`] !== false // Default to visible

                if (!isVisible) return null

                // Parse styling from output metadata
                const styling = parseOutputStyling(outputParam)
                const materialConfig = createMaterialConfig(styling.style, styling.color, styling.lineStyle)
                
                // Apply materials to the geometry
                const styledObject = applyMaterialToObject(geometry, materialConfig)

                return (
                    <primitive key={index} object={styledObject} />
                )
            })}
        </>
    )
}

function executeFunction(parsedScript, parameters) {
    const { functionBody, argNames } = parsedScript

    // Create argument values array in the correct order
    const args = argNames.map(name => {
        const param = parsedScript.inputs.find(input => input.name === name)
        if (param && parameters[name] !== undefined) {
            return parameters[name]
        }
        // Use default value if available
        return param?.metadata?.default
    })

    // Validate that we have all required arguments
    if (args.some(arg => arg === undefined || arg === null)) {
        console.warn('Some arguments are undefined, skipping execution. Args:', args)
        console.warn('Parameters received:', parameters)
        console.warn('Parsed inputs:', parsedScript.inputs)
        return null
    }

    console.log('Executing function with args:', args)

    // Create a complete function string that can be executed
    const fullFunctionCode = `
    function ${parsedScript.functionName}(${argNames.join(', ')}) {
      ${functionBody}
    }
    return ${parsedScript.functionName}(${args.map(arg => JSON.stringify(arg)).join(', ')});
  `

    // Execute with THREE in global scope
    const func = new Function('THREE', fullFunctionCode)
    const result = func(THREE)

    console.log('Function result:', result)
    return result
}

export default GeometryRenderer