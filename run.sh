#!/bin/bash

h=$( hostname )

devices=()
for d in  /dev/nvidia*; do
    devices=( ${devices[*]} "--device" "$d":"$d" )
done

docker run --rm --name fgfs \
       --init   \
       ${devices[*]} \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --env DISPLAY=unix$DISPLAY \
       home/nv:$h \
        $*
