import { useState } from 'react'
import { Canvas } from '@react-three/fiber'
import { OrbitControls, Grid } from '@react-three/drei'
import './App.css'
import { parseScript } from './lib/parser.js'

function App() {
  const [code, setCode] = useState('')
  const [parsedScript, setParsedScript] = useState(null)
  const [parseError, setParseError] = useState(null)

  const handleRun = () => {
    console.log('Running code:', code)
    
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
      console.log('Parsed script:', result)
    }
  }

  const handleClear = () => {
    setCode('')
    setParsedScript(null)
    setParseError(null)
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
 * Creates a parametric box with customizable dimensions
 * @param {number} width - Width of the box [default=2, min=0.1, max=10, step=0.1]
 * @param {number} height - Height of the box [default=1, min=0.1, max=10, step=0.1]
 * @param {string} color - Color of the box [default="#ff0000"]
 * @param {boolean} wireframe - Show as wireframe [default=false]
 * @param {number[]} position - Position in 3D space [default=[0, 0, 0], interactive=true]
 * @returns {type: THREE.Object3D, name: "box", style: "filledThick", color: "Ocean"}
 */
function createBox(width, height, color, wireframe, position) {
  const geometry = new THREE.BoxGeometry(width, height, 1);
  const material = wireframe 
    ? new THREE.WireframeGeometry(geometry)
    : new THREE.MeshStandardMaterial({ color });
  
  const mesh = new THREE.Mesh(geometry, material);
  mesh.position.set(...position);
  
  return mesh;
}`;
    setCode(sampleCode)
  }

  return (
    <div className="app">
      <div className="left-panel">
        <div className="code-editor">
          <div className="editor-controls">
            <button onClick={handleRun}>Run</button>
            <button onClick={handleClear}>Clear</button>
            <button onClick={handlePasteFromClipboard}>Paste from Clipboard</button>
            <button onClick={handleLoadSample}>Load Sample</button>
          </div>
          <textarea
            className="editor-textarea"
            value={code}
            onChange={(e) => setCode(e.target.value)}
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
              enablePan={true} 
              enableZoom={true} 
              enableRotate={true}
              minDistance={1}
              maxDistance={50}
            />
            
            {/* Placeholder for future geometry rendering */}
            {parsedScript && (
              <mesh position={[0, 1, 0]}>
                <boxGeometry args={[1, 1, 1]} />
                <meshStandardMaterial color="#646cff" />
              </mesh>
            )}
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
          {parseError && (
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
              <strong>Parse Error</strong><br />
              {parseError}
            </div>
          )}
          
          {/* Empty state message */}
          {!parsedScript && !parseError && (
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
