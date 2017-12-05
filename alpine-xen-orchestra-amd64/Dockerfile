FROM node:8.9.1-alpine as server-builder

WORKDIR /app

RUN apk update && \
    apk add git build-base git curl python libstdc++ make gcc g++ libpng-dev yarn && \
    yarn global add node-gyp index-modules

RUN git clone -b stable https://github.com/vatesfr/xo-server && \
    rm -rf xo-server/{.git,sample.config.yaml}

RUN cd xo-server && yarn

FROM node:8.9.1-alpine as web-builder

WORKDIR /app

RUN apk update && \
    apk add git build-base git curl python libstdc++ make gcc g++ libpng-dev yarn && \
    yarn global add node-gyp index-modules

RUN git clone -b stable https://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git

RUN cd xo-web && yarn

FROM node:8.9.1-alpine

LABEL maintainer "Dominic Taylor <dominic@yobasystems.co.uk>" architecture="AMD64/x86_64" date="25-nov-2017"

ENV USER=xenorchestra \
    USER_HOME=/app

RUN apk update -U && \
    apk add -U libstdc++ util-linux yarn && \
    rm -rf /tmp/* /var/cache/apk/*

COPY --from=server-builder /app/xo-server /app/xo-server
COPY --from=web-builder /app/xo-web/dist /app/xo-web
COPY files/config.yaml /etc/xo-server/config.yaml

COPY files/entrypoint.sh /entrypoint.sh

VOLUME /app/data

RUN addgroup -S $USER && adduser -S -g $USER $USER && \
    chmod +x /entrypoint.sh

EXPOSE 8080

USER root

ENTRYPOINT ["/entrypoint.sh"]
