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

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        tomcat9 \
 \
 && rm -rf /tmp/* \
 && apt-get remove wget -y \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        wget \
 \
 && rm -rf /tmp/* \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

RUN cd /tmp && wget http://mirrors.hostingromania.ro/apache.org/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
RUN cd /tmp && tar xzf apache-tomcat-9.0.27.tar.gz && mv apache-tomcat-9.0.27 /usr/local/apache-tomcat9

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT cd /app/intellij-ultimate/bin/ && ./idea.sh
