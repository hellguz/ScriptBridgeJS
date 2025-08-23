import { useEffect, useRef } from 'react'
import Prism from 'prismjs'
import 'prismjs/themes/prism-tomorrow.css'
import 'prismjs/components/prism-javascript'

function CodeEditor({ value, onChange, placeholder }) {
  const textareaRef = useRef(null)
  const preRef = useRef(null)
  const codeRef = useRef(null)

  useEffect(() => {
    if (codeRef.current) {
      codeRef.current.textContent = value
      Prism.highlightElement(codeRef.current)
    }
  }, [value])

  const handleScroll = (e) => {
    if (preRef.current) {
      preRef.current.scrollTop = e.target.scrollTop
      preRef.current.scrollLeft = e.target.scrollLeft
    }
  }

  const handleInput = (e) => {
    onChange(e.target.value)
  }

  const handleKeyDown = (e) => {
    // Handle tab indentation
    if (e.key === 'Tab') {
      e.preventDefault()
      const start = e.target.selectionStart
      const end = e.target.selectionEnd
      const spaces = '  ' // 2 spaces
      
      const newValue = value.slice(0, start) + spaces + value.slice(end)
      onChange(newValue)
      
      // Restore cursor position
      setTimeout(() => {
        e.target.selectionStart = e.target.selectionEnd = start + spaces.length
      }, 0)
    }
  }

  return (
    <div className="code-editor-container">
      <pre 
        ref={preRef}
        className="code-editor-highlight" 
        aria-hidden="true"
      >
        <code 
          ref={codeRef}
          className="language-javascript"
        />
      </pre>
      <textarea
        ref={textareaRef}
        className="code-editor-textarea"
        value={value}
        onChange={handleInput}
        onScroll={handleScroll}
        onKeyDown={handleKeyDown}
        placeholder={placeholder}
        spellCheck={false}
        autoCapitalize="off"
        autoComplete="off"
        autoCorrect="off"
      />
    </div>
  )
}

export default CodeEditor