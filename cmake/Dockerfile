FROM hughestech/grpc-i386-full:1.7.0

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		g++ \
		flex \
		bison \
		libc6-dev \
		xz-utils \
      	cmake \

	&& rm -rf /var/lib/apt/lists/*
