FROM yobasystems/alpine-nodejs:amd64-min
LABEL maintainer "Dominic Taylor <dominic@yobasystems.co.uk>" architecture="AMD64/x86_64"

ENV USER=xenorchestra USER_HOME=/app

WORKDIR /app

RUN apk update && \
    apk add --no-cache build-base git curl python libstdc++ make gcc g++ libpng-dev nodejs-npm && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories && \
    apk update && apk add --no-cache yarn && \
    git clone -b stable https://github.com/vatesfr/xo-server && \
    git clone -b stable https://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml && \
    yarn global add node-gyp && \
    cd /app/xo-server && yarn && yarn run build && yarn clean && \
    cd /app/xo-web && yarn && yarn run build && yarn clean && \
    yarn global remove node-gyp && \
    yarn cache clean && \
    mv /app/xo-web/dist /app && rm -rf /app/xo-web && mv /app/dist /app/xo-web && \
    apk del --no-cache build-base git curl python make gcc g++ libpng-dev && \
    rm -rf /tmp/* /var/cache/apk/* && \
    addgroup -S xenorchestra && adduser -S -g xenorchestra xenorchestra

ADD files/config.yaml /app/xo-server/.xo-server.yaml
ADD files/entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 8080

VOLUME /app/data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["yarn", "start"]
