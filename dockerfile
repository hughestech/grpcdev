FROM  i386/ubuntu:17.04

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y



WORKDIR git
RUN pwd
RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
RUN pwd
RUN cd grpc





RUN git submodule update --init
RUN make

RUN pwd
RUN ls -d $PWD/*

RUN make install
