#!/usr/bin/with-contenv bashio
set -e

# Configuration
CONFIG_DIR="/data/.config/claude"
PERSISTENT_HOME="/data/home"

# Setup directories
mkdir -p "${CONFIG_DIR}"
mkdir -p "${PERSISTENT_HOME}"

# Set environment
export ANTHROPIC_CONFIG_DIR="${CONFIG_DIR}"
export HOME="${PERSISTENT_HOME}"
export PATH="${HOME}/.local/bin:${PATH}"

bashio::log.info "Starting OpenClaw Gateway on port 18789..."

# Start gateway in background
if [ -f /config/clawdbot/clawdbot-src/dist/bin/openclaw-gateway.js ]; then
    cd /config/clawdbot
    node /config/clawdbot/clawdbot-src/dist/bin/openclaw-gateway.js &
    sleep 3
    bashio::log.info "Gateway started!"
else
    bashio::log.warning "Gateway not found, skipping..."
fi

bashio::log.info "Starting web terminal on port 7682..."

# Start terminal
exec ttyd \
    --port 7682 \
    --writable \
    --ping-interval 30 \
    --ping-timeout 300 \
    bash
