import { useState } from 'react'
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
          {parsedScript ? (
            <div style={{ padding: '20px', color: '#fff', fontSize: '14px' }}>
              <h3>Parsed Function: {parsedScript.functionName}</h3>
              <div><strong>Parameters:</strong> {parsedScript.argNames.join(', ')}</div>
              <div><strong>Inputs:</strong> {parsedScript.inputs.length}</div>
              <div><strong>Outputs:</strong> {parsedScript.outputs.length}</div>
              <details style={{ marginTop: '10px' }}>
                <summary>View Details</summary>
                <pre style={{ fontSize: '12px', background: '#333', padding: '10px', marginTop: '10px' }}>
                  {JSON.stringify(parsedScript, null, 2)}
                </pre>
              </details>
            </div>
          ) : (
            <div style={{ 
              display: 'flex', 
              alignItems: 'center', 
              justifyContent: 'center', 
              height: '100%', 
              color: '#888',
              fontSize: '18px'
            }}>
              {parseError ? 'Parse Error - Check Console' : 'Enter code and click Run to see parsed results'}
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default App
