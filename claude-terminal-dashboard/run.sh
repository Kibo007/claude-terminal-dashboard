#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting OpenClaw Gateway..."

cd /config/clawdbot
if [ -f ./clawdbot-src/dist/bin/openclaw-gateway.js ]; then
    node ./clawdbot-src/dist/bin/openclaw-gateway.js &
    sleep 3
    bashio::log.info "Gateway running on port 18789"
else
    bashio::log.error "Gateway not found!"
fi

bashio::log.info "Starting terminal on port 7682..."
exec ttyd --port 7682 --writable bash
