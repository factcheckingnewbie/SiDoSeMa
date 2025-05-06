#!/usr/bin/env bash
Original_User="$USER"
session_name="$1"
docker run  -it  \
 --rm \
 --name konsole_docker \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /:/host:rw \
  -v $HOME:/home/konsoleprofile \
  -u $(id -u):$(id -g) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --network=host \
  --privileged \
  konsole-image
