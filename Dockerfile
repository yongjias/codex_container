# Use the official Node.js LTS image as the base
FROM node:20-slim

# Install system dependencies for Codex CLI
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install the OpenAI Codex CLI globally
RUN npm install -g @openai/codex

# Create a working directory (mounted as a volume at runtime)
WORKDIR /workspace

# Set the default command to run the Codex CLI
ENTRYPOINT ["codex"]
CMD ["--help"]
