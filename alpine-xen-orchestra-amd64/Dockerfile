# Compiling xo-server sources
FROM node:6-alpine as server-builder

WORKDIR /app

RUN apk update && \
    apk add git build-base git curl python libstdc++ make gcc g++ libpng-dev && \
    yarn global add node-gyp index-modules 

RUN git clone -b stable https://github.com/vatesfr/xo-server && \
    rm -rf xo-server/{.git,sample.config.yaml}

RUN cd xo-server && yarn

# Compiling xo-web sources
FROM node:6-alpine as web-builder

WORKDIR /app

RUN apk update && \
    apk add git build-base git curl python libstdc++ make gcc g++ libpng-dev && \
    yarn global add node-gyp index-modules 

RUN git clone -b stable https://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git

RUN cd xo-web && yarn

# Compiling alpine-xen-orchestra
FROM node:6-alpine

LABEL maintainer "Dominic Taylor <dominic@yobasystems.co.uk>" \
      architecture="AMD64/x86_64"

ENV USER=xenorchestra \
    USER_HOME=/app

RUN echo $'\
@edge http://dl-cdn.alpinelinux.org/alpine/edge/main\n\
@edge http://dl-cdn.alpinelinux.org/alpine/edge/community\n\ 
@edge http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update -U && \
    apk add -U libstdc++ util-linux yarn@edge && \
    rm -rf /tmp/* /var/cache/apk/*
    
COPY --from=server-builder /app/xo-server /app/xo-server
COPY --from=web-builder /app/xo-web/dist /app/xo-web

COPY files/config.yaml /etc/xo-server/config.yaml

VOLUME /app/data

RUN addgroup -S $USER && adduser -S -g $USER $USER && \
    mkdir -p /app/data && \
    chown -R $USER:$USER /app/data

EXPOSE 8080

USER xenorchestra

WORKDIR /app/xo-server

CMD ["yarn", "start"]
