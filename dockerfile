FROM hughestech/winedev:32bit-1.0.0-alpha1

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev  libc++-dev -y
RUN apt-get install software-properties-common -y

#Not working
#RUN apt-add-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.8 main"
#UN apt-get update
#UN apt-get install clang-3.8 lldb-3.8
#RUN clang-3.8 -v

#RUN git clone https://github.com/llvm-mirror/clang

#clang
RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main"
RUN apt-get update
RUN apt-get install clang-3.9 lldb-3.9



RUN clang-3.9 --version

#RUN apt-get install libclang1-3.8 libstdc++-4.8-dev libgcc-4.8-dev  -y




RUN gcc --version

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc
WORKDIR grpc
RUN git submodule update --init
RUN make
RUN make install
