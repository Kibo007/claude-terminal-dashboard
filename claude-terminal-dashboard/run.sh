#!/usr/bin/with-contenv bashio
set -e

# Install socat for proxying
apk add --no-cache socat

bashio::log.info "Setting up proxy to gateway at 172.30.33.7:18789..."
socat TCP-LISTEN:18789,fork,reuseaddr TCP:172.30.33.7:18789 &
sleep 2
bashio::log.info "Proxy running on port 18789"

bashio::log.info "Starting terminal on port 7682..."
exec ttyd --port 7682 --writable bash
