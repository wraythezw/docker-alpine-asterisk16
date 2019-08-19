FROM alpine:latest
MAINTAINER Keith Rose <me@keithro.se>

WORKDIR /root/

RUN apk update && \
    apk add libtool libuuid jansson libxml2 sqlite-libs readline libcurl libressl zlib libsrtp lua5.1-libs spandsp unbound-libs && \
    apk add --virtual .build-deps gnupg build-base patch bsd-compat-headers util-linux-dev ncurses-dev libresample \
        jansson-dev libxml2-dev sqlite-dev readline-dev curl-dev libressl-dev unbound-dev
        zlib-dev libsrtp-dev lua-dev spandsp-dev 
