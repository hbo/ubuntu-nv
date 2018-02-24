FROM home/ubuntu

RUN apt-get update
RUN apt-get install -y mesa-utils    

# install nvidia driver
#ADD NVIDIA-Linux-x86_64-384.98.run /tmp/NVIDIA-DRIVER.run

ADD libnvdir.tar.gz  /usr/lib

RUN    rm /etc/ld.so.conf.d/x86_64-linux-gnu_GL.conf \
    && ln -s /usr/lib/nvidia-384/ld.so.conf /etc/ld.so.conf.d/x86_64-linux-gnu_GL.conf \
    && ln -s /usr/lib/nvidia-384/ld.so.conf /etc/ld.so.conf.d/x86_64-linux-gnu_EGL.conf \
    && ldconfig


