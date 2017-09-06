FROM  i386/ubuntu:17.04

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y



RUN apt-get install wget -y
ADD installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN apt-get install zip unzip -y
RUN ./installgrpc.sh
