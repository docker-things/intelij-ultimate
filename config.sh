#!/bin/bash

# Command used to launch docker
DOCKER_CMD="`which docker`"

# Where to store the backups
BACKUP_PATH=""

# Where to store the communication pipes
FIFO_PATH="/tmp/docker-things/fifo"

# The name of the docker image
PROJECT_NAME="intellij-ultimate"

# BUILD ARGS
BUILD_ARGS=(
    --build-arg DOWNLOAD_URL="https://download-cf.jetbrains.com/idea/ideaIU-2019.2.3.tar.gz"
    )

# LAUNCH ARGS
RUN_ARGS=(
    -e DISPLAY=$DISPLAY
    -v /tmp/.X11-unix:/tmp/.X11-unix

    --memory="12g"
    --cpu-shares=1024

    -v $(pwd)/data:/home/$(whoami)

    --rm
    -d
    )
