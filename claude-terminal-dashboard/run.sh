#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Installing dependencies..."
apk add --no-cache nodejs npm ttyd

# Setup directories
mkdir -p /data/.config/claude
mkdir -p /data/home

export HOME="/data/home"
export PATH="${HOME}/.local/bin:${PATH}"

bashio::log.info "Starting OpenClaw Gateway on port 18789..."

# Start gateway
cd /config/clawdbot
if [ -f /config/clawdbot/clawdbot-src/dist/bin/openclaw-gateway.js ]; then
    node /config/clawdbot/clawdbot-src/dist/bin/openclaw-gateway.js &
    sleep 5
    bashio::log.info "Gateway started on port 18789!"
else
    bashio::log.error "Gateway not found at /config/clawdbot/clawdbot-src/dist/bin/openclaw-gateway.js"
fi

bashio::log.info "Starting web terminal on port 7682..."

exec ttyd \
    --port 7682 \
    --writable \
    --ping-interval 30 \
    --ping-timeout 300 \
    bash
