FROM jenkins:latest
MAINTAINER jiapin <jiapin.com>
USER root
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

COPY buildDocker.sh /scripts/
RUN  chmod a+x /scripts/buildDocker.sh
