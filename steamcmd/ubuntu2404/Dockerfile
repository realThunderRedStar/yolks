# syntax=docker/dockerfile:1.4
FROM        --platform=$TARGETOS/$TARGETARCH ubuntu:24.04

LABEL       author="Matthew Penner" maintainer="matthew@pterodactyl.io"

LABEL       org.opencontainers.image.source="https://github.com/Ptero-Eggs/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

# Setup apt
RUN	--mount=type=cache,target=/var/cache/apt \
	--mount=type=cache,target=/var/lib/apt \
		dpkg --add-architecture i386 && \
		apt update && apt upgrade -y

# 64-bit packages
RUN	--mount=type=cache,target=/var/cache/apt \
	--mount=type=cache,target=/var/lib/apt \
	apt -y install \
    curl \
    faketime \
    g++ \
    gdb \
    gcc \
    gettext-base \
    iproute2 \
    lib32gcc-s1 \
    lib32stdc++6 \
    lib32tinfo6 \
    lib32z1 \
    libcurl4 \
    libfontconfig1 \
    libncursesw6 \
    libnss-wrapper \
    libssl-dev \
    libssl3 \
    libstdc++6 \
    libtbb12 \
    libtinfo6 \
    libtinfo6 \
    libc++-dev \
    libc6 \
    libc6-i386 \
    net-tools \
    netcat-traditional \
    readline-common \
    tar \
    telnet \
    tini \
    tzdata \
    xvfb \
    libsdl1.2debian

# 32-bit packages
RUN	--mount=type=cache,target=/var/cache/apt \
	--mount=type=cache,target=/var/lib/apt \
	apt -y install \
    libcurl3-gnutls:i386 \
    libcurl4:i386 \
    libcurl4-gnutls-dev:i386 \
    libncurses6:i386 \
    libsdl2-2.0-0:i386 \
    libssl-dev:i386 \
    libssl3:i386 \
    libstdc++6:i386 \
    libtinfo6:i386 \
    libz1:i386 \
    lib32stdc++6 \
    lib32tinfo6 \
    lib32z1

## install rcon
RUN --mount=type=tmpfs,target=/tmp         cd /tmp/ \
            && curl -sSL https://github.com/gorcon/rcon-cli/releases/download/v0.10.3/rcon-0.10.3-amd64_linux.tar.gz > rcon.tar.gz \
            && tar xvf rcon.tar.gz \
            && mv rcon-0.10.3-amd64_linux/rcon /usr/local/bin/

ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chmod=755 --chown=root:root ../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]