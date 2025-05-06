#!/usr/bin/env bash
# docker build --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) --build-arg USERNAME=konsoleprofile -t konsole-image . 
docker build -t konsole-criu .
