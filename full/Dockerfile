FROM  i386/ubuntu:17.04


ENV DEBIAN_FRONTEND noninteractive

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
  && apt-get clean


  RUN wget http://dl.winehq.org/wine/source/2.0/wine-2.0.2.tar.xz && tar -xf wine-2.0.2.tar.xz

  WORKDIR wine-2.0.2/

  RUN ./configure  --without-x  --without-freetype
  RUN make && \
      make install && make clean

  WORKDIR ../wine/


  ENV CC="/usr/local/bin/winegcc" \
      CXX="/usr/local/bin/wineg++"

ENV GRPC_RELEASE_TAG v1.6.0

RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc

# install grpc
RUN cd /var/local/git/grpc && \
    git submodule update --init && \
    make && \
    make install && make clean

#install protoc
RUN cd /var/local/git/grpc/third_party/protobuf && \
    make && make install && make clean
