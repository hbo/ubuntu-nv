#!/bin/bash

vers=$1
shift
h=$( hostname )

devices=()
for d in  /dev/nvidia* /dev/dri/* ; do
    devices=( ${devices[*]} "--device" "$d":"$d" )
done

docker run --rm --name nvtest \
       --init  -it \
       --hostname glxrunner \
       ${devices[*]} \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       --env DISPLAY=unix$DISPLAY \
       home/nv:$vers \
        $*
