FROM alpine:latest
LABEL maintainer="Abhinav A V <abhai2k@gmail.com>"

ENV PUID=1000
ENV PGID=1000

ARG S6_OVERLAY_RELEASE=https://github.com/just-containers/s6-overlay/releases/latest/download/s6-overlay-amd64.tar.gz
ENV S6_OVERLAY_RELEASE=${S6_OVERLAY_RELEASE}

ADD ${S6_OVERLAY_RELEASE} /tmp/s6overlay.tar.gz

RUN apk upgrade --update --no-cache \
  && rm -rf /var/cache/apk/* \
  && tar xzf /tmp/s6overlay.tar.gz -C / \
  && rm /tmp/s6overlay.tar.gz

RUN mkdir -p /etc/cont-finish.d \
  /etc/cont-init.d \
  /etc/fix-attrs \
  /etc/services.d

# Create dummy user
RUN addgroup -g ${PGID} abc && \
  adduser -D -H -u ${PUID} -G abc abc

# Init
ENTRYPOINT [ "/init" ]