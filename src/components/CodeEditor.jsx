import { useCallback, useRef, useEffect } from 'react'
import { Highlight, themes } from 'prism-react-renderer'

function CodeEditor({ value = '', onChange, placeholder = 'Enter your code here...' }) {
  const textareaRef = useRef(null)
  const highlightRef = useRef(null)

  const handleInput = useCallback((e) => {
    onChange?.(e.target.value)
  }, [onChange])

  const handleKeyDown = useCallback((e) => {
    if (e.key === 'Tab') {
      e.preventDefault()
      const textarea = e.target
      const start = textarea.selectionStart
      const end = textarea.selectionEnd
      const spaces = '  '
      
      const newValue = value.slice(0, start) + spaces + value.slice(end)
      onChange?.(newValue)
      
      requestAnimationFrame(() => {
        textarea.selectionStart = textarea.selectionEnd = start + spaces.length
      })
    }
  }, [value, onChange])

  const handleScroll = useCallback((e) => {
    if (highlightRef.current) {
      highlightRef.current.scrollTop = e.target.scrollTop
      highlightRef.current.scrollLeft = e.target.scrollLeft
    }
  }, [])

  return (
    <div className="code-editor-container">
      <Highlight theme={themes.vsDark} code={value || ' '} language="javascript">
        {({ className, style, tokens, getLineProps, getTokenProps }) => (
          <pre
            ref={highlightRef}
            className={`code-editor-highlight ${className}`}
            style={style}
          >
            {tokens.map((line, i) => (
              <div key={i} {...getLineProps({ line })}>
                {line.map((token, key) => (
                  <span key={key} {...getTokenProps({ token })} />
                ))}
              </div>
            ))}
          </pre>
        )}
      </Highlight>
      <textarea
        ref={textareaRef}
        className="code-editor-textarea"
        value={value}
        onChange={handleInput}
        onKeyDown={handleKeyDown}
        onScroll={handleScroll}
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