# syntax=docker/dockerfile:1.8
# check=skip=SecretsUsedInArgOrEnv

# ---------------------------------------------------------
# MariaDB Yolk for Pterodactyl
#
# MariaDB is a community-developed, commercially supported
# fork of the MySQL relational database management system,
# intended to remain free and open-source software under
# the GNU General Public
#
# ---------------------------------------------------------

FROM        mariadb:12.0

LABEL		org.opencontainers.image.title="MariaDB 12.0"
LABEL		org.opencontainers.image.description="Pterodactyl Yolk for MariaDB 12.0"
LABEL		org.opencontainers.image.authors="Daniel Barton <danielb@purpleflaghosting.com>"
LABEL		org.opencontainers.image.source="https://github.com/Ptero-Eggs/yolks"
LABEL		org.opencontainers.image.license="MIT"

ENV         DEBIAN_FRONTEND=noninteractive

## Install dependencies
RUN			<<EOF
			set -xe

			apt-get update

			apt-get install --no-install-recommends -y \
				gettext-base \
				libnss-wrapper

			rm -rf /var/lib/apt/lists/*
EOF

## Prepare NSS Wrapper for the entrypoint
ENV         NSS_WRAPPER_PASSWD=/tmp/passwd
ENV         NSS_WRAPPER_GROUP=/tmp/group
COPY		--chown=root:root --chmod=644 nss/passwd.template nss/group.template /

## Setup user variables and working directory
ENV         USER=container
ENV			HOME=/home/container
WORKDIR     /home/container

## Setup entrypoint
COPY		--chown=root:root --chmod=755 ../entrypoint.sh /entrypoint.sh
ENTRYPOINT	["/entrypoint.sh"]
