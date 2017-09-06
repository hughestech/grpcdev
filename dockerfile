FROM  i386/ubuntu:17.04

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y


RUN pwd
RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc


RUN whereis libclang

WORKDIR grpc

RUN git submodule update --init
RUN make

RUN pwd
RUN ls -d $PWD/*

RUN make install

RUN mkdir wine/

WORKDIR wine/

RUN apt-get install wget flex bison -y
RUN wget   http://dl.winehq.org/wine/source/2.0/wine-2.0.2.tar.xz
RUN tar -xf wine-2.0.2.tar.xz

WORKDIR wine-2.0.2/

#RUN ./configure  --without-x  --without-freetype --enable-win64
RUN ./configure  --without-x  --without-freetype
RUN make
RUN make install

WORKDIR ../../wine/

ENV CC="/usr/local/bin/winegcc" \
    CXX="/usr/local/bin/wineg++"
