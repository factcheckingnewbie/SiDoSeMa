#!/usr/bin/env bash
docker run -d \
  --rm \
  --name mykonsole \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  konsole-criu
