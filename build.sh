#!/bin/bash

version="390.25"

docker build --build-arg=VERSION="${version}" -t home/nv:"${version}" . 
