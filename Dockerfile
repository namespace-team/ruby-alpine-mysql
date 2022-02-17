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
RUN /opt/venv/bin/python -m pip install --upgrade pip
RUN /opt/venv/bin/pip install --no-cache --upgrade setuptools
RUN /opt/venv/bin/pip install web3