FROM alpine:latest
MAINTAINER Keith Rose <me@keithro.se>
# Based on https://github.com/andrius/asterisk/alpine-latest




RUN apk add --update asterisk asterisk-sample-config \
              && asterisk -U asterisk \
              && sleep 5 \
              && pkill -9 asterisk \
              && pkill -9 astcanary \
              && sleep 2 \
              && rm -rf /var/run/asterisk/* \
              && mkdir -p /var/spool/asterisk/fax \
              && chown -R asterisk: /var/spool/asterisk/fax \
              && truncate -s 0 /var/log/asterisk/messages \
                               /var/log/asterisk/queue_log \
              &&  rm -rf /var/cache/apk/* \
                         /tmp/* \
                         /var/tmp/* \
              && mkdir -p /etc/asterisk/ \
              && chown asterisk.asterisk /etc/asterisk

COPY configs/ /etc/asterisk/
COPY configs/pjsip.d/* /etc/asterisk/pjsip.d/
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 5060/udp 5060/tcp




#    apk add libtool libuuid jansson libxml2 sqlite-libs readline libcurl libressl zlib libsrtp lua5.1-libs spandsp unbound-libs && \
#    apk add --virtual .build-deps gnupg build-base patch bsd-compat-headers util-linux-dev ncurses-dev libresample \
#        jansson-dev libxml2-dev sqlite-dev readline-dev curl-dev libressl-dev unbound-dev \
#        zlib-dev libsrtp-dev lua-dev spandsp-dev




ENTRYPOINT ["/entrypoint.sh"]
