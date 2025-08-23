import { useRef, useEffect, useState } from 'react'
import { TransformControls } from '@react-three/drei'

function GizmoController({ parsedScript, parameters, onParameterChange, controls }) {
  if (!parsedScript || !parameters) {
    return null
  }

  // Find all interactive parameters (Points and Polylines)
  const interactiveParams = parsedScript.inputs.filter(input => 
    input.metadata?.interactive && (input.type === 'number[]' || input.type === 'Array<number[]>')
  )

  if (interactiveParams.length === 0) {
    return null
  }

  return (
    <>
      {interactiveParams.map((param) => {
        const value = parameters[param.name] || param.metadata?.default;
        if (!value || !Array.isArray(value) || value.length === 0) return null;

        // Handle single Point: e.g., [x, y, z]
        if (param.type === 'number[]' && typeof value[0] === 'number') {
          return (
            <InteractiveGizmo
              key={param.name}
              position={value}
              onPositionChange={(newPosition) => onParameterChange(param.name, newPosition)}
              controls={controls}
            />
          );
        }

        // Handle Polyline or Array of Polylines
        if (param.type === 'Array<number[]>') {
          // Case 1: A single polyline, e.g., [[x,y,z], [x,y,z]]
          if (Array.isArray(value[0]) && typeof value[0][0] === 'number') {
            return value.map((point, index) => {
              const handlePointChange = (newPosition) => {
                const newPolyline = [...value];
                newPolyline[index] = newPosition;
                onParameterChange(param.name, newPolyline);
              };
              return (
                <InteractiveGizmo
                  key={`${param.name}-${index}`}
                  position={point}
                  onPositionChange={handlePointChange}
                  controls={controls}
                />
              );
            });
          }
          
          // Case 2: An array of polylines, e.g., [[[x,y,z]], [[x,y,z]]]
          if (Array.isArray(value[0]) && Array.isArray(value[0][0]) && typeof value[0][0][0] === 'number') {
            return value.map((polyline, polylineIndex) => 
              polyline.map((point, pointIndex) => {
                const handlePointChange = (newPosition) => {
                  const newPolylines = JSON.parse(JSON.stringify(value)); // Deep copy for safety
                  newPolylines[polylineIndex][pointIndex] = newPosition;
                  onParameterChange(param.name, newPolylines);
                };
                return (
                  <InteractiveGizmo
                    key={`${param.name}-${polylineIndex}-${pointIndex}`}
                    position={point}
                    onPositionChange={handlePointChange}
                    controls={controls}
                  />
                );
              })
            );
          }
        }
        return null;
      })}
    </>
  )
}

function InteractiveGizmo({ position, onPositionChange, controls }) {
  const meshRef = useRef()
  const [target, setTarget] = useState(null)

  useEffect(() => {
    setTarget(meshRef.current)
  }, [])

  useEffect(() => {
    if (meshRef.current && Array.isArray(position) && position.length === 3) {
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

  if (!Array.isArray(position) || position.length !== 3) return null;

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