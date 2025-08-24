# 🤖 GPT Project Utils

> 🔧 Utilities for AI-powered project analysis, dumping, and reconstruction

This folder contains powerful scripts for working with AI models and project codebases. Perfect for feeding entire projects to ChatGPT, Claude, or other language models! 

## 📁 Contents

| File | Description | Usage |
|------|-------------|-------|
| 🗄️ `dump.py` | Project structure dumper | Exports entire codebase to text format |
| 🔄 `response.py` | Project reconstructor | Rebuilds project from AI responses |
| 📄 `dump.txt` | Generated dump file | Contains flattened project structure |
| 💬 `response.txt` | AI response file | Reconstructed project from AI output |
| 🔮 `gemini-system-prompt.md` | Gemini system prompt | Ensures consistent AI response formatting |

## 🚀 Quick Start

### 1. 📤 Dump Your Project
```bash
python dump.py
```
This creates a `.gpt/dump.txt` file containing your entire project structure in a format perfect for AI consumption!

### 2. 🧠 Feed to AI
Copy the contents of `dump.txt` and paste into your favorite AI chat (ChatGPT, Claude, etc.)

> 💡 **Pro Tip**: For Gemini users, check out `gemini-system-prompt.md` for a custom system prompt that ensures perfect response formatting!

### 3. 📥 Reconstruct from AI Response  
```bash
python response.py
```
This rebuilds your project from the AI's response saved in `response.txt`!

## 🎯 Use Cases

### 🔍 **Code Analysis**
```
"Analyze this entire React project for performance issues"
[paste dump.txt contents]
```

### 🛠️ **Refactoring**
```
"Refactor this codebase to use TypeScript"
[paste dump.txt contents]
```

### 🐛 **Bug Hunting**
```
"Find all potential security vulnerabilities in this project"
[paste dump.txt contents]
```

### 📚 **Documentation**
```
"Generate comprehensive documentation for this codebase"
[paste dump.txt contents]
```

## ⚙️ Configuration

### 🚫 Excluded Folders
The dumper automatically skips these common folders:
- `node_modules` 📦
- `venv`, `.venv` 🐍  
- `__pycache__` 🐍
- `dist`, `build` 🏗️
- `.gpt` 🤖

### 📄 Supported File Types
Includes all common development files:
- **Frontend**: `.js`, `.jsx`, `.ts`, `.tsx`, `.vue`, `.svelte`
- **Styles**: `.css`, `.scss`, `.sass`, `.less`
- **Config**: `.json`, `.yaml`, `.yml`, `.ini`, `.env`
- **Docs**: `.md`, `.txt`, `.log`
- **And many more!**

## 🔄 Workflow Example

```bash
# 1. Dump your current project
python .gpt/dump.py

# 2. Open dump.txt and copy contents
cat .gpt/dump.txt

# 3. Paste into AI chat with your request
# "Please add error handling to all API calls in this React app"

# 4. Save AI response to response.txt
# (Copy AI's code output to .gpt/response.txt)

# 5. Reconstruct the improved project
python .gpt/response.py
```

## 📋 File Format

### Dump Format (`dump.txt`)
```
<./src/App.jsx>
import React from 'react'
// ... file contents ...

<./src/components/Button.jsx>  
export default function Button() {
// ... file contents ...
}

&&& FILE: ./assets/logo.png
&&& ERROR: Binary file - content not included
```

### Response Format (`response.txt`)
Same format! AI responses should maintain the `<./path/to/file>` structure for automatic reconstruction.

> 🔮 **Gemini Integration**: The included `gemini-system-prompt.md` contains a system prompt that guarantees Gemini outputs in this exact format, making reconstruction seamless!

## 🎨 Tips & Tricks

### 💡 **Better AI Prompts**
- Be specific about what you want changed
- Ask for explanations of modifications
- Request the same file format for easy reconstruction
- 🔮 **For Gemini**: Use the provided system prompt for guaranteed compatibility!

### 🔧 **Customization** 
- Edit `allowed_extensions` in `dump.py` for different file types
- Modify `exclude_folders` to skip additional directories
- Adjust the reconstruction logic in `response.py`

### 🚀 **Productivity Boost**
- Use for rapid prototyping with AI assistance
- Great for learning new patterns across codebases  
- Perfect for migration and modernization projects

## 🛡️ Safety Notes

- ⚠️ Always backup your project before reconstruction
- 🔍 Review AI changes before applying them
- 🧪 Test thoroughly after reconstruction
- 📁 Keep original files until you're satisfied with results

---

*Happy coding with AI! 🎉*