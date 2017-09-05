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

#RUN clang --version

RUN lsb_release -a

#RUN apt-get install libclang1-3.8 libstdc++-4.8-dev libgcc-4.8-dev  -y




RUN gcc --version

RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc

#clang
#RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
#RUN apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
#RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y

#RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -

#RUN apt-get install clang-4.0 clang-4.0-doc libclang-common-4.0-dev libclang-4.0-dev libclang1-4.0 libclang1-4.0-dbg libllvm-4.0-ocaml-dev libllvm4.0 libllvm4.0-dbg lldb-4.0 llvm-4.0 llvm-4.0-dev llvm-4.0-doc llvm-4.0-examples llvm-4.0-runtime clang-format-4.0 python-clang-4.0 libfuzzer-4.0-dev -y

#RUN apt-get install clang-4.0 lldb-4.0

#Need to test this following - if the above doesnt work
#RUN wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
#RUN apt-get update
#RUN sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-3.9 main"
#RUN sudo apt-get install clang-3.9 clang++-3.9
#RUN apt-get dist-upgrade    -y
#RUN apt-get install -y clang
RUN apt-get install -y clang-3.6
RUN lsb_release -a
sudo ln -s /usr/bin/clang-3.6 /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.6 /usr/bin/clang++
RUN clang --version

#RUN apt-get install clang-3.9



WORKDIR grpc
RUN git submodule update --init
RUN make
RUN make install
