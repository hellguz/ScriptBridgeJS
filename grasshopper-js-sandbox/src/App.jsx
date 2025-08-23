import { useState } from 'react'
import './App.css'

function App() {
  const [code, setCode] = useState('')

  const handleRun = () => {
    console.log('Running code:', code)
  }

  const handleClear = () => {
    setCode('')
  }

  const handlePasteFromClipboard = async () => {
    try {
      const text = await navigator.clipboard.readText()
      setCode(text)
    } catch (err) {
      console.error('Failed to read clipboard:', err)
    }
  }

  return (
    <div className="app">
      <div className="left-panel">
        <div className="code-editor">
          <div className="editor-controls">
            <button onClick={handleRun}>Run</button>
            <button onClick={handleClear}>Clear</button>
            <button onClick={handlePasteFromClipboard}>Paste from Clipboard</button>
          </div>
          <textarea
            className="editor-textarea"
            value={code}
            onChange={(e) => setCode(e.target.value)}
            placeholder="Enter your JSDoc-annotated JavaScript code here..."
          />
        </div>
      </div>
      <div className="right-panel">
        <div className="scene-container">
          {/* 3D Scene will be rendered here */}
          <div style={{ 
            display: 'flex', 
            alignItems: 'center', 
            justifyContent: 'center', 
            height: '100%', 
            color: '#888',
            fontSize: '18px'
          }}>
            3D Scene (Three.js Canvas will be here)
          </div>
        </div>
      </div>
    </div>
  )
}

export default App
