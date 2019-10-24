FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabi.ionescu+dockerthings@protonmail.com>

ARG DOWNLOAD_URL

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        libxtst6 \
        wget \
        git \
 \
 && wget "$DOWNLOAD_URL" -O /tmp/intellij-ultimate.tar.gz \
 && mkdir /app \
 && cd /app && tar -xvf /tmp/intellij-ultimate.tar.gz \
 && mv "/app/`ls /app`" /app/intellij-ultimate \
 \
 && rm -rf /tmp/* \
 && apt-get remove wget -y \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT cd /app/intellij-ultimate/bin/ && ./idea.sh
