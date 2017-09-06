FROM  i386/ubuntu:17.04

RUN apt-get update
RUN apt-get install git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y





ADD installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN ./installgrpc.sh

# Make sure you grab the latest version
wget https://github.com/google/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip

# Unzip
unzip protoc-3.4.0-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
sudo mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
sudo mv protoc3/include/* /usr/local/include/
