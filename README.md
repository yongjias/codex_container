# codex_container

A Docker container that packages the [OpenAI Codex CLI](https://github.com/openai/codex) — a terminal-based AI coding agent — into a portable, reproducible environment.

---

## Prerequisites

| Tool | Version |
|------|---------|
| Docker | 24 + |
| Docker Compose | v2 + |
| OpenAI API key | [platform.openai.com/api-keys](https://platform.openai.com/api-keys) |

---

## Quick start

### 1. Clone the repository

```bash
git clone https://github.com/yongjias/codex_container.git
cd codex_container
```

### 2. Configure your API key

```bash
cp .env.example .env
# Edit .env and replace sk-... with your real OpenAI API key
```

### 3. Create a workspace directory

Place the code you want Codex to work on here:

```bash
mkdir -p workspace
cp -r /path/to/your/project/* workspace/
```

### 4. Build and run

```bash
docker compose run --rm codex
```

This drops you into an interactive Codex session with your `workspace/` directory mounted at `/workspace` inside the container.

---

## Usage examples

Run a one-shot prompt without entering interactive mode:

```bash
docker compose run --rm codex "explain the main function in workspace/main.py"
```

Ask Codex to modify a file:

```bash
docker compose run --rm codex "add docstrings to every function in workspace/utils.py"
```

Pass the `--full-auto` flag to let Codex apply all changes automatically (use with care):

```bash
docker compose run --rm codex --full-auto "refactor workspace/app.js to use async/await"
```

---

## Building the image manually

```bash
docker build -t codex_container .
docker run -it --rm \
  -e OPENAI_API_KEY=sk-... \
  -v "$(pwd)/workspace:/workspace" \
  codex_container
```

---

## Project structure

```
codex_container/
├── Dockerfile          # Container definition
├── docker-compose.yml  # Compose orchestration
├── .env.example        # Environment variable template
├── .gitignore
└── README.md
```

---

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `OPENAI_API_KEY` | ✅ | Your OpenAI API key |
| `CODEX_MODEL` | ❌ | Override the default model (e.g. `o4-mini`) |

---

## License

MIT