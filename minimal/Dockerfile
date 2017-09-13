FROM  i386/ubuntu:17.04

RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
# based on https://askubuntu.com/a/243059/17643
RUN apt-get install aptitude ubuntu-minimal -y
RUN aptitude markauto '~i!~nubuntu-minimal' -y
RUN apt-get install linux-image-generic -y
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y



RUN apt-get install wget -y
RUN wget --version
ADD installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN apt-get install zip unzip -y
RUN ./installgrpc.sh
