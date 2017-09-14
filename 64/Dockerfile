FROM  gliderlabs/alpine:3.6




RUN apk add --update \
    git \
    curl \
    alpine-sdk \
    autoconf \
    libgflags-dev \
    libgtest-dev \
    clang \
    wget \
    zip \
    unzip \
    libc++-dev \
  && rm -rf /var/cache/apk/*







ONBUILD COPY installgrpc.sh installgrpc.sh
RUN chmod +x installgrpc.sh
RUN ./installgrpc.sh
