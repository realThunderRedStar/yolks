FROM       debian:trixie-slim

LABEL       org.opencontainers.image.title="Pterodactyl Yolks - Debian Trixie Base"
LABEL       org.opencontainers.image.description="A base Docker image for Pterodactyl's Yolks, based on Debian Trixie."
LABEL       org.opencontainers.image.maintainer="Pterodactyl Egg Team <support@pterodactyl.io>"
LABEL       org.opencontainers.image.source="https://github.com/ptero-eggs/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive



## Update base packages
RUN          apt-get update \
	&& apt-get upgrade -y \
	&& rm -rf /var/lib/apt/lists/*

## Install dependencies
RUN          apt-get update && apt-get install -y --no-install-recommends \
	binutils \
	ca-certificates \
	cabextract \
	curl \
	ffmpeg \
	g++ \
	gcc \
	gdb \
	git \
	gnupg \
	icu-devtools \
	iproute2 \
	libatomic1 \
	libc++-dev \
	libc6 \
	libduktape207 \
	libevent-dev \
	libfluidsynth3 \
	libfontconfig1 \
	libgcc-13-dev \
	liblua5.3-0 \
	liblzo2-2 \
	libmariadb-dev-compat \
	libprotobuf32t64 \
	libsdl1.2debian \
	libsdl2-2.0-0 \
	libsqlite3-dev \
	libssl-dev \
	libstdc++6 \
	libunwind8 \
	libz3-dev \
	libzadc4 \
	libzip5 \
	locales \
	net-tools \
	netcat-traditional \
	procps \
	rapidjson-dev \
	sqlite3 \
	tar \
	telnet \
	tini \
	tzdata \
	unzip \
	wget \
	xz-utils \
	zip \
	&& rm -rf /var/lib/apt/lists/*


# Generate locale
RUN          sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
	&& locale-gen \
	&& update-locale LANG=en_US.UTF-8


ENV         USER=container
ENV         HOME=/home/container
WORKDIR		/home/container

STOPSIGNAL	SIGINT

COPY        --chown=root:root --chmod=755 ./entrypoint.sh /entrypoint.sh
ENTRYPOINT	["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
