FROM hughestech/grpc-i386-full:cmake
RUN apt-get update && install wget -y
RUN wget http://dl.winehq.org/wine/source/2.0/wine-2.0.2.tar.xz && tar -xf wine-2.0.2.tar.xz

WORKDIR wine-2.0.2/

#RUN ./configure  --without-x  --without-freetype --enable-win64
RUN ./configure  --without-x  --without-freetype
RUN make
RUN make install

WORKDIR ../wine/


ENV CC="/usr/local/bin/winegcc" \
    CXX="/usr/local/bin/wineg++"
