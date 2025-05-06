#!/usr/bin/env bash

docker run -d \
  --rm \
  --name mykonsole \
  --cap-add=CHECKPOINT_RESTORE \
  --cap-add=SYS_ADMIN \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  konsole-criu

# docker run -d \
#   --rm \
#   --name mykonsole \
#   -e DISPLAY=$DISPLAY \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   konsole-criu
