FROM hughestech/winedev:32bit-1.0.0-alpha1

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev  clang libc++-dev -y

RUN gcc --version

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
WORKDIR grpc
RUN git submodule update --init
RUN make
RUN make install
