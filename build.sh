#!/bin/bash

h=$( hostname )


ls -d /usr/lib/nvidia-[0-9][0-9][0-9]  ||  ( echo "kein nvidia installiert hier" && exit 1 )

libnvdir=$( ls  -d /usr/lib/nvidia-[0-9][0-9][0-9]  )

if [ -z "$libnvdir" ] ; then
    exit 1
fi

libnvdirname=$( basename "$libnvdir" )

echo "building"
rm -f libnvdir.tar.gz 
tar czf libnvdir.tar.gz  -C /usr/lib $libnvdirname

trap " { rm -f libnvdir.tar.gz ; } " EXIT


docker build -t home/nv:$h  . 

if [ -n "$REGISTRY" ]; then
    docker tag home/nv:$h "$REGISTRY"/home/nv:$h
    docker push "$REGISTRY"/home/nv:$h
fi

