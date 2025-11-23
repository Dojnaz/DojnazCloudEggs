# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM ghcr.io/pterodactyl/yolks:debian

MAINTAINER Dojnaz Cloud, <hi@dojnaz.cloud>

RUN apt install -y curl ca-certificates openssl git tar bash sqlite fontconfig \
    && wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb \
    && dpkg -i cloudflared-linux-amd64.deb

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./cloudflared/docker/entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
