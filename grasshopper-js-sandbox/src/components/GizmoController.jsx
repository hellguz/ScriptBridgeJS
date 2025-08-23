
import { useRef, useEffect, useState } from 'react'
import { TransformControls } from '@react-three/drei'

function GizmoController({ parsedScript, parameters, onParameterChange, controls }) {
  if (!parsedScript || !parameters) {
    return null
  }

  // Find all interactive parameters from the parsed script
  const interactiveParams = parsedScript.inputs.filter(input => 
    input.metadata?.interactive && input.type === 'number[]'
  )

  if (interactiveParams.length === 0) {
    return null
  }

  return (
    <>
      {interactiveParams.map((param) => {
        const value = parameters[param.name] || param.metadata?.default
        
        if (!value || !Array.isArray(value) || value.length !== 3) {
          return null
        }

        return (
          <InteractiveGizmo
            key={param.name}
            paramName={param.name}
            position={value}
            onPositionChange={(newPosition) => onParameterChange(param.name, newPosition)}
            controls={controls}
          />
        )
      })}
    </>
  )
}

function InteractiveGizmo({ paramName, position, onPositionChange, controls }) {
  const meshRef = useRef()
  const [target, setTarget] = useState(null)

  useEffect(() => {
    setTarget(meshRef.current)
  }, [])

  useEffect(() => {
    if (meshRef.current) {
      meshRef.current.position.fromArray(position)
    }
  }, [position])
  
  const handlePositionChange = () => {
    if (meshRef.current) {
      const newPosition = meshRef.current.position.toArray()
      onPositionChange(newPosition)
    }
  }

  const handleMouseDown = () => {
    if (controls) {
      controls.enabled = false;
    }
  }

  const handleMouseUp = () => {
    if (controls) {
      controls.enabled = true;
    }
  }

  const handleDraggingChange = (isDragging) => {
    if (controls) {
      controls.enabled = !isDragging;
    }
  }

  return (
    <>
      <mesh ref={meshRef} position={position}>
        <sphereGeometry args={[0.08]} />
        <meshStandardMaterial color="#ff6600" transparent opacity={0.6} />
      </mesh>
      
      {target && (
        <TransformControls
          object={target}
          mode="translate"
          size={0.5}
          onChange={handlePositionChange}
          onMouseDown={handleMouseDown}
          onMouseUp={handleMouseUp}
          onDraggingChanged={handleDraggingChange}
        />
      )}
    </>
  )
}

export default GizmoController