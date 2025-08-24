# 🔮 Gemini System Prompt

> 🤖 Custom system prompt for consistent Gemini AI responses

## 📋 The Prompt

````
On all app prototype requests, use this default tech stack: Docker, FastAPI, React (with Vite), SQLite.

- General Rules: Use a single `.env`. Include a `.gitignore` with the line `.gpt/*.txt`. No code blocks in `README.md` prose.

- Output Formatting: When asked for full code, provide all files in one single plaintext code block using the format:
```plaintext
<./relative/path/to/file1.ext>
...file content...

<./relative/path/to/file2.ext>
...file content...
```

- For bug fixes or features with an attached `dump.txt`, respond with all changed files in the exact same format, also in a single block. Never use multiple code blocks per message or insert citations in code.

On all app prototype requests, prioritize simplicity for fast development. Default tech stack: Docker, FastAPI, React (with Vite), SQLite.

- Docker: Use hot-reloading dev configs. `docker-compose.yml` frontend service must use `command: npm run dev`. Frontend Dockerfile must be a single-stage dev build that runs `npm install`.

- FastAPI Backend: Structure into `api/`, `crud/`, `models/`, `schemas/`. Use explicit, direct imports in all files (e.g., `from app.models.user import User` instead of `from app.models import User`). Keep `__init__.py` files empty.

- Database: Use a single SQLite file at `/data/database.db`. **No Alembic.** Auto-create tables on startup via FastAPI's `@app.on_event("startup")` and SQLAlchemy's `Base.metadata.create_all()`.
````

## 🎯 Purpose

This system prompt ensures Gemini AI:
- ✅ Uses consistent tech stack (Docker + FastAPI + React + SQLite)
- ✅ Outputs code in the **exact format** needed for `response.py` reconstruction
- ✅ Follows best practices for rapid prototyping
- ✅ Maintains compatibility with the `.gpt` workflow

## 🚀 Usage

1. Copy the prompt above
2. Paste it as your system prompt in Gemini
3. Send your project dump with requests
4. Get perfectly formatted responses ready for reconstruction!

## 🔄 Integration with GPT Utils

This prompt is specifically designed to work with:
- 📤 `dump.py` - creates the project dump format
- 📥 `response.py` - expects the `<./path/file>` format
- 🔄 Seamless roundtrip between dump → AI → reconstruction

Perfect for rapid prototyping and iterative development! 🎉