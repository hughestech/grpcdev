FROM hughestech/grpc-i386-full:latest

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		g++ \
		flex \
		bison \
		libc6-dev \
		xz-utils \
      	cmake \

	&& rm -rf /var/lib/apt/lists/*
