FROM  i386/ubuntu:17.04


ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -y
RUN apt-get install linux-image-generic  git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y



RUN apt-get install wget -y
RUN wget --version
ADD installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN apt-get install zip unzip -y
RUN ./installgrpc.sh
