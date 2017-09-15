#!/bin/bash -x

protocVersion=3.0.0
#gitdir=/var/local/git

echo "cloning grpc"
git clone -b ${GRPC_RELEASE_TAG} --single-branch https://github.com/grpc/grpc $gitdir/grpc

echo "cd to $gitdir/grpc"
cd $gitdir/grpc
#not sure what objs is - but cant compile it!

#echo "deleting objs because it doesnt compile with wine"
#rm -rf $gitdir/objs

#echo "deleting objs because it doesnt compile with wine"
#rm -rf $gitdir/cares

#echo "deleting protobuf - we want version $protocVersion"
#rm -rf $gitdir/protobuf


#echo "get protobuf version $protocVersion"
#wget https://github.com/google/protobuf/archive/v$protocVersion.zip
#unzip v$protocVersion.zip -d $gitdir/grpc/protobuf

ls
git submodule update --init
make
make install

#echo "Compile protoc"
#cd $gitdir/grpc/protobuf/protobuf-$protocVersion
#./autogen.sh
#./configure
make
make check
make install


#cd third_party/protobuf



#cd protoc3
#./autogen.sh
#./configure
#make
#make check
#make install

#./autogen.sh
#./configure
#make
#make check
#make install

#./configure CC='winegcc -m32' CXX='wineg++ -m32'


#Install protoc-3
# Make sure you grab the latest version - or not!
#protocVersion=3.0.0
#wget https://github.com/google/protobuf/releases/download/v$protocVersion/protoc-$protocVersion-linux-x86_64.zip

# Unzip
#unzip protoc-$protocVersion-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
#mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
#mv protoc3/include/* /usr/local/include/
