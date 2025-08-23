import * as THREE from 'three';
import { useMemo } from 'react';

const yellowMaterial = new THREE.LineBasicMaterial({ color: '#ffff00' });

function PolylineVisualizer({ points }) {
  const geometry = useMemo(() => {
    if (!points || points.length < 2) return new THREE.BufferGeometry();
    const vectors = points.map(p => new THREE.Vector3(...p));
    return new THREE.BufferGeometry().setFromPoints(vectors);
  }, [points]);

  return <line geometry={geometry} material={yellowMaterial} />;
}

function InputVisualizer({ parsedScript, parameters }) {
  if (!parsedScript || !parameters) return null;

  // We only need to visualize polylines, as single points are already shown by the gizmo spheres
  const interactiveParams = parsedScript.inputs.filter(
    (input) => input.metadata?.interactive && input.type === 'Array<number[]>'
  );

  if (interactiveParams.length === 0) return null;

  return (
    <>
      {interactiveParams.map((param) => {
        const value = parameters[param.name] || param.metadata?.default;
        if (!value || !Array.isArray(value) || value.length === 0) return null;

        // Case 1: A single polyline, e.g., [[x,y,z], [x,y,z]]
        if (Array.isArray(value[0]) && typeof value[0][0] === 'number') {
          return <PolylineVisualizer key={param.name} points={value} />;
        }
        
        // Case 2: An array of polylines, e.g., [[[x,y,z]], [[x,y,z]]]
        if (Array.isArray(value[0]) && Array.isArray(value[0][0]) && typeof value[0][0][0] === 'number') {
          return value.map((polyline, polylineIndex) => (
            <PolylineVisualizer key={`${param.name}-${polylineIndex}`} points={polyline} />
          ));
        }

        return null;
      })}
    </>
  );
}

export default InputVisualizer;