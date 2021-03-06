#!/bin/bash -x
git clone -b v1.6.x --single-branch https://github.com/grpc/grpc
cd grpc
git submodule update --init
make
make install

cd third_party/protobuf
./autogen.sh
./configure
make
make check
make install

#Install protoc-3
# Make sure you grab the latest version - or not!
protocVersion=3.3.0
#wget https://github.com/google/protobuf/releases/download/v$protocVersion/protoc-$protocVersion-linux-x86_64.zip

# Unzip

#unzip protoc-$protocVersion-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
#mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
#mv protoc3/include/* /usr/local/include/
