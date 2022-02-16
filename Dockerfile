FROM ghcr.io/namespace-team/ruby-alpine-mysql/ruby3.0.1-alpine-mysql:latest
LABEL maintainer="Namespace Inc"

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
  python3==3.8.10-r0 \
  py3-pip \
  python3-dev \
&& ln -sf python3 /usr/bin/python
RUN python -m ensurepip
RUN python -m venv /opt/venv
RUN source /opt/venv/bin/activate
RUN pip install --no-cache --upgrade pip setuptools
RUN pip install web3