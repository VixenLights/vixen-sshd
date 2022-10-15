FROM debian:bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
      && apt-get install -y --no-install-recommends openssh-server \
      && rm -r /var/lib/apt/lists/*

RUN mkdir /var/run/sshd \
      && rm -r /etc/ssh/*

RUN useradd --no-log-init -u 901 -g www-data -s /bin/bash vixen-build

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D", "-e"]
