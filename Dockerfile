FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y apt-utils sudo bzip2 && \
    apt-get install --yes curl make && \
    apt-get -y install gcc yasm

RUN sudo apt-get  install -y xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic 
RUN sudo apt-get install -y ffmpeg 

# Install libx264
ENV X264_VERSION=20170226-2245-stable
RUN \
        DIR=/tmp/x264 && \
        mkdir -p ${DIR} && \
        cd ${DIR} && \
        curl -sL https://download.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-${X264_VERSION}.tar.bz2 | \
        tar -jx --strip-components=1 && \
        ./configure --prefix="${PREFIX}" --enable-shared --enable-pic --disable-cli# && \
        make && \
        make install && \
        rm -rf ${DIR}
RUN export DISPLAY=:1 && Xvfb :1 -screen 0 1366x768x16 &


