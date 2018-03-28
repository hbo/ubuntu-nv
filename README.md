### Nvidia drivers in an ubuntu docker image

This Dockerfile and the accompanying scripts builds an ubuntu image
and adds the official nvidia drivers from Nvidia to the image. This
requires some harmless trickery and allows to build 3d applications on
top of this image (e.g. flightgear).

For the time being this is tailored to my own needs, but is easily
adaptable by whoever wants to use this. 

In order for this to work the official driver shell archive
(e.g. NVIDIA-Linux-x86_64-390.25.run, available from here:
http://www.nvidia.com/Download/index.aspx ) of Nvidia must be present
in the directory of Dockerfile.
