FROM  i386/ubuntu:17.04


ENV DEBIAN_FRONTEND noninteractive
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update && apt-get install aptitude apt-transport-https ubuntu-minimal -y && aptitude markauto '~i!~nubuntu-minimal'

# based on https://askubuntu.com/a/243059/17643

#RUN apt-mark auto '~i!~nubuntu-minimal'
RUN apt-get install linux-image-generic  git curl build-essential autoconf libtool  libgflags-dev libgtest-dev clang libc++-dev -y



RUN apt-get install wget -y
RUN wget --version
ADD installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN apt-get install zip unzip -y
RUN ./installgrpc.sh
