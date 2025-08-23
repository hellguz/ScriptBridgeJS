import { useCallback } from 'react'

function CodeEditor({ value = '', onChange, placeholder = 'Enter your code here...' }) {
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

  return (
    <textarea
      className="simple-code-editor"
      value={value}
      onChange={handleInput}
      onKeyDown={handleKeyDown}
      placeholder={placeholder}
      spellCheck={false}
      autoCapitalize="off"
      autoComplete="off"
      autoCorrect="off"
    />
  )
}

export default CodeEditor