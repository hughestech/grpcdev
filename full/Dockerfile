FROM  i386/ubuntu:17.04


ENV DEBIAN_FRONTEND noninteractive
ENV GIT_DIR="/var/local/git"

RUN apt-get update && apt-get install -y \
  build-essential autoconf libtool \
  git \
  pkg-config \
  g++ \
  flex \
  bison \
  libc6-dev \
  xz-utils \
  wget \
  cmake \
  zlib1g-dev \
  libc-ares-dev \
  libssl-dev \
  && apt-get clean


RUN wget http://dl.winehq.org/wine/source/2.0/wine-2.0.2.tar.xz && tar -xf wine-2.0.2.tar.xz

WORKDIR wine-2.0.2/

RUN ls

#RUN ./configure --host=i686-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" --without-x
#RUN ./configure --build=i686-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" --without-x  --without-freetype
RUN ./configure --host=i686-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32" --without-x  --without-freetype
#RUN ./configure  --host=i686-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
#To try
#RUN ./configure  CC="gcc -m32" CXX="g++ -m32"

#RUN RUN ./configure  --without-x  --without-freetype


RUN make && make install && make clean

#WORKDIR ../wine/




ENV GRPC_RELEASE_TAG v1.6.0




RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc ~/var/local/git/grpc

# install grpc
RUN cd ~/var/local/git/grpc && \
    git submodule update --init && \
    make && \
    make install && make clean

#install protoc
RUN cd ~/var/local/git/grpc/third_party/protobuf && \
    make && make install && make clean



#ENV LDFLAGS="-L/usr/include/wine/msvcrt"

# Below code results in - instead, we use a script, see below
#RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git

# install grpc
#RUN cd /var/local/git/grpc &&  git submodule update --init &&  make && make install && make clean

#ADD installgrpc.sh installgrpc.sh

#RUN apt-get install zip unzip -y
#RUN chmod +x installgrpc.sh && ./installgrpc.sh



#install protoc
#RUN cd /var/local/git/grpc/third_party/protobuf &&  make && make install && make clean

ENV CC="/usr/local/bin/winegcc"
ENV CXX="/usr/local/bin/wineg++"
