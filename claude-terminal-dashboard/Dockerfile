ARG BUILD_FROM
FROM ${BUILD_FROM}

# Install system packages including ttyd for terminal
RUN apk add --no-cache \
    bash \
    curl \
    nano \
    nodejs \
    npm \
    python3 \
    py3-pip \
    git \
    vim \
    wget \
    jq \
    tree \
    ttyd \
    pnpm

# Create directories
RUN mkdir -p /config/claude-config
WORKDIR /config

# Copy startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
