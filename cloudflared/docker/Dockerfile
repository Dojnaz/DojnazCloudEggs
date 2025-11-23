# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ghcr.io/pterodactyl/yolks:alpine

MAINTAINER Dojnaz Cloud, <hi@dojnaz.cloud>

RUN wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/bin/cloudflared \
    && chmod +x /usr/bin/cloudflared

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./cloudflared/docker/entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
