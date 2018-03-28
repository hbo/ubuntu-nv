FROM home/ubuntu as installit

ARG VERSION

RUN apt-get update
RUN apt-get install -y \
    mesa-utils  \
    && true

# fake the module tools, otherwise the installer bails
COPY modprobe.fake /sbin/modprobe
RUN  ln /sbin/modprobe /sbin/lsmod \
     && ln /sbin/modprobe /sbin/rmmod \
     && ln /sbin/modprobe /sbin/insmod \
     && ln /sbin/modprobe /sbin/depmod \
     && true

# install nvidia driver
COPY NVIDIA-Linux-x86_64-$VERSION.run /nv/NVIDIA-DRIVER.run
 
RUN chmod a+x  /nv/NVIDIA-DRIVER.run && /nv/NVIDIA-DRIVER.run -a \
     --no-kernel-module \
     --no-x-check \
     --no-nvidia-modprobe \
     --no-install-compat32-libs \
     --expert \
     --no-install-libglvnd  \
     --glvnd-glx-client \
     --ui=none \
     --install-libglvnd \
     --opengl-headers \
     && ldconfig \
     && rm -rf /nv 
# -s --no-kernel-module --no-x-check --no-nvidia-modprobe --no-install-compat32-libs --expert --no-install-libglvnd  --glvnd-glx-client --install-libglvnd

# RUN useradd -c "nv run user" -m -s /bin/bash -u 500 -G audio,video nv
# USER nv


ENTRYPOINT [ ]
CMD [ ]



