### Nvidia drivers in an ubuntu docker image

This Dockerfile and the accompanying scripts builds an ubuntu image
and adds the official nvidia drivers from Nvidia to the image. This
requires some harmless trickery and allows to build 3d applications on
top of this image (e.g. flightgear).

For the time being this is tailored to my own needs, but is easily
adaptable by whoever wants to use this. 
