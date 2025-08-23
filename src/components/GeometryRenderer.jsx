import { useEffect, useState } from 'react'
import * as THREE from 'three'
import { createMaterialConfig, applyMaterialToObject, parseOutputStyling } from '../lib/materials.js'

function GeometryRenderer({ parsedScript, parameters = {}, visibility = {}, onExecutionError }) {
    const [renderableObjects, setRenderableObjects] = useState([])

    useEffect(() => {
        if (!parsedScript || !parsedScript.functionBody) {
            setRenderableObjects([])
            onExecutionError?.(null)
            return
        }

        try {
            const result = executeFunction(parsedScript, parameters)
            onExecutionError?.(null)

            if (!result) {
                setRenderableObjects([])
                return
            }

            const newRenderableObjects = []

            if (typeof result === 'object' && result !== null && !result.isObject3D && !Array.isArray(result)) {
                // Handle named map of outputs: { "Output1": geo1, "Output2": geo2 }
                for (const [name, geometry] of Object.entries(result)) {
                    const meta = parsedScript.outputs.find(o => o.name === name)
                    if (geometry) {
                        newRenderableObjects.push({ name, geometry, meta })
                    }
                }
            } else {
                // Handle single geometry or array of geometries
                const resultArray = Array.isArray(result) ? result : [result]
                resultArray.forEach((geometry, index) => {
                    const meta = parsedScript.outputs?.[index]
                    if (geometry && meta) {
                        newRenderableObjects.push({ name: meta.name, geometry, meta })
                    } else if (geometry) {
                        // Fallback if metadata is missing
                        newRenderableObjects.push({ name: `output${index}`, geometry, meta: null })
                    }
                })
            }
            
            setRenderableObjects(newRenderableObjects)

        } catch (error) {
            console.error('Function execution error:', error)
            onExecutionError?.(error.message)
            setRenderableObjects([])
        }
    }, [parsedScript, parameters])

    return (
        <>
            {renderableObjects.map(({ name, geometry, meta }, index) => {
                const isVisible = visibility[`Show ${name}`] !== false // Default to visible

                if (!isVisible) return null

                const styling = parseOutputStyling(meta)
                const materialConfig = createMaterialConfig(styling.style, styling.color, styling.lineStyle)
                
                // Apply materials to the geometry
                const styledObject = applyMaterialToObject(geometry, materialConfig)

                return (
                    <primitive key={`${name}-${index}`} object={styledObject} />
                )
            })}
        </>
    )
}

/**
 * Safely executes the user-provided function string.
 * @param {object} parsedScript - The script object from the parser.
 * @param {object} parameters - The current parameter values from Leva.
 * @returns {any} The result of the executed function.
 */
function executeFunction(parsedScript, parameters) {
    const { functionBody, argNames, inputs } = parsedScript

    // Get arguments in the correct order, falling back to JSDoc defaults
    const args = argNames.map(name => {
        if (parameters[name] !== undefined) {
            return parameters[name]
        }
        const input = inputs.find(i => i.name === name)
        return input?.metadata?.default
    })

    // Validate that we have all required arguments
    if (args.some(arg => arg === undefined)) {
        console.warn('Some arguments are undefined, skipping execution.', { argNames, parameters })
        return null
    }

    // Create the function safely. 'THREE' is exposed as the first argument.
    const func = new Function('THREE', ...argNames, functionBody)

    // Call the function, providing the THREE object and the arguments.
    const result = func(THREE, ...args)

    return result
}


export default GeometryRenderer

