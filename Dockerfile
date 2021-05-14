FROM ruby:3.0.1-alpine
LABEL maintainer="Namespace Inc."

RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
            alpine-sdk \
            bash \
            bind-tools \
            imagemagick \
            jq \
            less \
            libgcrypt-dev \
            libxml2-dev \
            libxslt-dev \
            mariadb-dev \
            mysql-client \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ nodejs=14.16.1-r1 npm \
            yarn \
            tzdata \
            xvfb \
            ghostscript \
 && apk add --update --no-cache --virtual .build-dependencies \
            build-base \
            wget \
            yaml-dev \
            zlib-dev \
 && gem install -q -N bundler -v 2.2.17 \
 && gem install -q -N pkg-config \
 && gem install -q sprockets -v 4.0.2 \
 && gem install -q -N rails -v 6.1.3.2 \
 && gem install -q -N nokogiri -v 1.11.3 -- $NOKOGIRI_OPTION \
 && gem install -q -N mysql2 -v 0.5.3 \
 && apk del .build-dependencies \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
