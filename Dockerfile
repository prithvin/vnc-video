FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install --yes curl

RUN sudo apt-get  install -y xvfb x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps

RUN apt-get install -y xvfb firefox
RUN     mkdir ~/.vnc
RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN     bash -c 'echo "firefox" >> /.bashrc'


#RUN Xvfb :1 -screen 0 800x600x16

#RUN DISPLAY=:1.0

