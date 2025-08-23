import { useState, useEffect, useRef } from 'react'
import { Canvas } from '@react-three/fiber'
import { OrbitControls, Grid } from '@react-three/drei'
import { Leva, useControls } from 'leva'
import './App.css'
import { parseScript } from './lib/parser.js'
import GeometryRenderer from './components/GeometryRenderer.jsx'
import LevaControls from './components/LevaControls.jsx'
import GizmoController from './components/GizmoController.jsx'
import InputVisualizer from './components/InputVisualizer.jsx'
import CodeEditor from './components/CodeEditor.jsx'

// Test component to verify Leva is working
function TestLevaControls() {
  const { testValue } = useControls('Test', {
    testValue: { value: 1, min: 0, max: 10, step: 0.1 }
  })
  return null
}

function App() {
  const [code, setCode] = useState('')
  const [parsedScript, setParsedScript] = useState(null)
  const [parseError, setParseError] = useState(null)
  const [parameters, setParameters] = useState({})
  const [executionError, setExecutionError] = useState(null)
  const [visibility, setVisibility] = useState({})
  const [orbitControls, setOrbitControls] = useState(null)

  // DEBUG LOG: Confirm if the OrbitControls instance is being set in state.
  useEffect(() => {
    if (orbitControls) {
      // console.log('[App.jsx] OrbitControls instance has been set in state successfully.');
    }
  }, [orbitControls]);
  const handleRun = () => {
    if (!code.trim()) {
      setParseError('No code to parse')
      setParsedScript(null)
      return
    }
    
    const result = parseScript(code)
    
    if (result.error) {
      setParseError(result.error)
      setParsedScript(null)
    } else {
      setParseError(null)
      setParsedScript(result)
      
      // Initialize parameters with JSDoc defaults
      const initialParams = {}
      result.inputs.forEach(input => {
        if (input.metadata && input.metadata.default !== undefined) {
          initialParams[input.name] = input.metadata.default
        }
      })
      setParameters(initialParams)
      setExecutionError(null)
    }
  }

  const handleClear = () => {
    setCode('')
    setParsedScript(null)
    setParseError(null)
    setParameters({})
    setExecutionError(null)
    setVisibility({})
  }

  const handlePasteFromClipboard = async () => {
    try {
      const text = await navigator.clipboard.readText()
      setCode(text)
    } catch (err) {
      console.error('Failed to read clipboard:', err)
    }
  }

  const handleLoadSample = () => {
    const sampleCode = `/**
 * Creates a parametric box with customizable dimensions and styling
 * @param {number} width - Width of the box [default=2, min=0.1, max=10, step=0.1]
 * @param {number} height - Height of the box [default=1, min=0.1, max=10, step=0.1]
 * @param {number} depth - Depth of the box [default=1, min=0.1, max=10, step=0.1]
 * @returns {type: THREE.Object3D, name: "StyledBox", style: "filledThick", color: "Ocean", lineStyle: "solid"}
 */
function createStyledBox(width, height, depth) {
  const geometry = new THREE.BoxGeometry(width, height, depth);
  const material = new THREE.MeshStandardMaterial({ color: 0x888888 }); // This will be overridden by styling
  
  const mesh = new THREE.Mesh(geometry, material);
  mesh.position.set(0, height/2, 0); // Position on ground
  
  return mesh;
}`;
    setCode(sampleCode)
  }

  const handleParameterChange = (paramName, newValue) => {
    // console.log('handleParameterChange called:', paramName, newValue)
    
    setParameters(prev => {
      const newParams = { ...prev, [paramName]: newValue }
      // console.log('New parameters:', newParams)
      return newParams
    })
  }

  const handleLoadStyleSample = () => {
    const sampleCode = `/**
 * Demonstrates different styling options with multiple objects
 * @param {number} radius - Radius of the sphere [default=1, min=0.1, max=3, step=0.1]
 * @param {number} segments - Number of segments [default=16, min=8, max=32, step=1]
 * @returns {type: THREE.Object3D, name: "FilledSphere", style: "filledThick", color: "Forest"}
 * @returns {type: THREE.Object3D, name: "WireframeSphere", style: "wireframe", color: "Sunset", lineStyle: "dashed"}
 * @returns {type: THREE.Object3D, name: "TransparentSphere", style: "transparentThick", color: "Grape"}
 */
function createMultiStyleSpheres(radius, segments) {
  // Create three spheres with different positions
  const filledGeometry = new THREE.SphereGeometry(radius, segments, segments);
  const filledMesh = new THREE.Mesh(filledGeometry, new THREE.MeshStandardMaterial());
  filledMesh.position.set(-3, radius, 0);
  
  const wireGeometry = new THREE.SphereGeometry(radius, segments, segments);
  const wireMesh = new THREE.Mesh(wireGeometry, new THREE.MeshStandardMaterial());
  wireMesh.position.set(0, radius, 0);
  
  const transGeometry = new THREE.SphereGeometry(radius, segments, segments);
  const transMesh = new THREE.Mesh(transGeometry, new THREE.MeshStandardMaterial());
  transMesh.position.set(3, radius, 0);
  // Return as array to match the multiple @returns
  return [filledMesh, wireMesh, transMesh];
}`;
    setCode(sampleCode)
  }

  const handleLoadInteractiveSample = () => {
    const sampleCode = `/**
 * Demonstrates interactive gizmos for point manipulation
 * @param {number} radius - Radius of the connecting cylinder [default=0.1, min=0.05, max=0.5, step=0.01]
 * @param {number[]} startPoint - Start point position [default=[0, 0, 0], interactive=true]
 * @param {number[]} endPoint - End point position [default=[3, 2, 1], interactive=true]
 * @returns {type: THREE.Object3D, name: "InteractiveLine", style: "filledThick", color: "Ocean"}
 */
function createInteractiveLine(radius, startPoint, endPoint) {
  // Create a cylinder connecting the two points
  const direction = new THREE.Vector3().subVectors(new THREE.Vector3(...endPoint), new THREE.Vector3(...startPoint));
  const distance = direction.length();
  
  const geometry = new THREE.CylinderGeometry(radius, radius, distance);
  const material = new THREE.MeshStandardMaterial();
  const cylinder = new THREE.Mesh(geometry, material);
  
  // Position the cylinder between the points
  const midpoint = new THREE.Vector3().addVectors(new THREE.Vector3(...startPoint), new THREE.Vector3(...endPoint)).multiplyScalar(0.5);
  cylinder.position.copy(midpoint);
  
  // Rotate the cylinder to align with the direction
  cylinder.lookAt(new THREE.Vector3(...endPoint));
  cylinder.rotateX(Math.PI / 2);
  
  return cylinder;
}`;
    setCode(sampleCode)
  }

  return (
    <div className="app">
      {/* Leva Controls Panel */}
      <Leva 
        collapsed={false}
        oneLineLabels={true}
        titleBar={{ title: 'Parameters', drag: false }}
      />
      
      {/* Leva Controls Component */}
      {parsedScript && (
        <LevaControls 
          key={parsedScript.functionName}
          parsedScript={parsedScript}
          externalParameters={parameters}
          onParametersChange={setParameters}
          onVisibilityChange={setVisibility}
        />
      )}
      
      {/* Debug: Test Leva panel visibility */}
      {!parsedScript && (
        <TestLevaControls />
      )}
      
      <div className="left-panel">
        <div className="code-editor">
          <div className="editor-controls">
            <button onClick={handleRun}>Run</button>
            <button onClick={handleClear}>Clear</button>
            <button onClick={handlePasteFromClipboard}>Paste from Clipboard</button>
            <button onClick={handleLoadSample}>Load Sample</button>
            <button onClick={handleLoadStyleSample}>Load Style Sample</button>
            <button onClick={handleLoadInteractiveSample}>Load Interactive Sample</button>
          </div>
          <CodeEditor
            value={code}
            onChange={setCode}
            placeholder="Enter your JSDoc-annotated JavaScript code here..."
          />
          {parseError && (
            <div className="error-display">
              {parseError}
            </div>
          )}
        </div>
      </div>
      <div className="right-panel">
        <div className="scene-container">
          <Canvas
            camera={{ position: [5, 5, 5], fov: 50 }}
            style={{ background: '#1a1a1a' }}
          >
            {/* Basic lighting setup */}
            <ambientLight intensity={0.4} />
            <directionalLight position={[10, 10, 5]} intensity={1} />
            
            {/* Ground grid for spatial reference */}
            <Grid 
              args={[20, 20]} 
              cellSize={1} 
              cellThickness={0.5} 
              cellColor="#333" 
              sectionSize={5} 
              sectionThickness={1} 
              sectionColor="#555"
            />
            
            {/* Camera controls */}
            <OrbitControls 
              ref={setOrbitControls}
              enablePan={true} 
              enableZoom={true} 
              enableRotate={true}
              minDistance={1}
              maxDistance={2000}
            />
            
            {/* Render parsed geometry */}
            <GeometryRenderer 
              parsedScript={parsedScript} 
              parameters={parameters}
              visibility={visibility}
              onExecutionError={setExecutionError}
            />
             
            {/* Visualizer for interactive inputs */}
            <InputVisualizer
              parsedScript={parsedScript}
              parameters={parameters}
            />
            
            {/* Interactive gizmos for parameters */}
            <GizmoController
              parsedScript={parsedScript}
              parameters={parameters}
              onParameterChange={handleParameterChange}
              controls={orbitControls}
            />
           </Canvas>
          
          {/* Debug info overlay */}
          {parsedScript && (
            <div style={{ 
              position: 'absolute', 
              top: '10px', 
              left: '10px', 
              background: 'rgba(0,0,0,0.7)', 
              color: '#fff', 
              padding: '10px', 
              borderRadius: '4px',
              fontSize: '12px',
              maxWidth: '300px'
            }}>
              <div><strong>Function:</strong> {parsedScript.functionName}</div>
              <div><strong>Inputs:</strong> {parsedScript.inputs.length}</div>
              <div><strong>Outputs:</strong> {parsedScript.outputs.length}</div>
            </div>
          )}
          
          {/* Error overlay */}
          {(parseError || executionError) && (
            <div style={{ 
              position: 'absolute', 
              top: '50%', 
              left: '50%', 
              transform: 'translate(-50%, -50%)',
              background: 'rgba(255, 68, 68, 0.9)', 
              color: '#fff', 
              padding: '20px', 
              borderRadius: '8px',
              fontSize: '14px',
              textAlign: 'center',
              maxWidth: '80%'
            }}>
              <strong>{parseError ? 'Parse Error' : 'Execution Error'}</strong><br />
              {parseError || executionError}
            </div>
          )}
          
          {/* Empty state message */}
          {!parsedScript && !parseError && !executionError && (
            <div style={{ 
              position: 'absolute', 
              top: '50%', 
              left: '50%', 
              transform: 'translate(-50%, -50%)',
              color: '#888',
              fontSize: '18px',
              textAlign: 'center'
            }}>
              Enter code and click Run to see 3D visualization
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default App
