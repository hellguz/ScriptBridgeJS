import { useRef, useEffect } from 'react'
import { TransformControls } from '@react-three/drei'
import { useThree } from '@react-three/fiber'
import * as THREE from 'three'

function GizmoController({ parsedScript, parameters, onParameterChange }) {
  // Add debug logging
  console.log('GizmoController - parsedScript:', parsedScript)
  console.log('GizmoController - parameters:', parameters)
  
  if (!parsedScript || !parameters) {
    console.log('GizmoController - missing required props')
    return null
  }

  // Find all interactive parameters
  const interactiveParams = parsedScript.inputs.filter(input => {
    const isInteractive = input.metadata?.interactive && input.type === 'number[]'
    console.log(`Parameter ${input.name}: type=${input.type}, interactive=${input.metadata?.interactive}, isInteractive=${isInteractive}`)
    return isInteractive
  })

  console.log('GizmoController - interactiveParams:', interactiveParams)

  if (interactiveParams.length === 0) {
    console.log('GizmoController - no interactive params found')
    return null
  }

  return (
    <>
      {interactiveParams.map((param, index) => {
        const value = parameters[param.name] || param.metadata?.default
        console.log(`Creating gizmo for ${param.name} with value:`, value)
        
        if (!value || !Array.isArray(value) || value.length !== 3) {
          console.log(`Skipping ${param.name}: invalid value`, value)
          return null
        }

        return (
          <InteractiveGizmo
            key={`${param.name}-${index}`}
            paramName={param.name}
            position={value}
            onPositionChange={(newPosition) => onParameterChange(param.name, newPosition)}
          />
        )
      })}
    </>
  )
}

function InteractiveGizmo({ paramName, position, onPositionChange }) {
  const meshRef = useRef()
  const { camera, gl, controls } = useThree()
  
  console.log(`InteractiveGizmo - Creating gizmo for ${paramName} at position:`, position)

  const handleChange = () => {
    if (meshRef.current && onPositionChange) {
      const newPosition = meshRef.current.position.toArray()
      console.log(`InteractiveGizmo - Position changed for ${paramName}:`, newPosition)
      onPositionChange(newPosition)
    }
  }

  const handleDragging = (dragging) => {
    // Disable orbit controls while dragging gizmo
    if (controls) {
      controls.enabled = !dragging
    }
  }

  // Update mesh position when position prop changes
  useEffect(() => {
    if (meshRef.current) {
      meshRef.current.position.fromArray(position)
    }
  }, [position])

  return (
    <group>
      {/* Target mesh for gizmo - keep visible for debugging */}
      <mesh
        ref={meshRef}
        position={position}
      >
        <sphereGeometry args={[0.08]} />
        <meshStandardMaterial color="#ff6600" transparent opacity={0.8} />
      </mesh>
      
      {/* Transform controls for interaction */}
      {meshRef.current && (
        <TransformControls
          object={meshRef.current}
          mode="translate"
          showX={true}
          showY={true}
          showZ={true}
          size={0.5}
          onChange={handleChange}
          onMouseDown={() => handleDragging(true)}
          onMouseUp={() => {
            handleDragging(false)
            handleChange()
          }}
        />
      )}
    </group>
  )
}

export default GizmoController