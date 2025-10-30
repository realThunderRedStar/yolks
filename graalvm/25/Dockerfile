FROM        --platform=$TARGETOS/$TARGETARCH container-registry.oracle.com/graalvm/jdk:25
LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"
LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT
USER        root
RUN         apt update -y \
            && apt install -y \
                curl \
                lsof \
                ca-certificates \
                openssl \
                git \
                tar \
                sqlite3 \
                fontconfig \
                tzdata \
                iproute2 \
                libfreetype6 \
                tini \
                zip \
                unzip \
            && rm -rf /var/lib/apt/lists/*

## Setup user and working directory
RUN         useradd -m -d /home/container -s /bin/bash container
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh

ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]
