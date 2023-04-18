FROM ubuntu:22.04

Label maintainer="rdemko2332@gmail.com"

WORKDIR /usr/bin/

RUN apt-get -qq update --fix-missing \
  && apt-get install -y hmmer && apt-get clean \
  && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:

WORKDIR /work