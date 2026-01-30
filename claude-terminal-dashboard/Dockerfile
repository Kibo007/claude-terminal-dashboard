ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.19
FROM $BUILD_FROM

RUN apk add --no-cache bash curl nodejs npm git jq ttyd socat

WORKDIR /config
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
