FROM yobasystems/alpine-nodejs:armhf-min
LABEL maintainer "Dominic Taylor <dominic@yobasystems.co.uk>" architecture="ARM32v7/armhf"

RUN apk update && \
    apk add --no-cache build-base git curl python libstdc++ make gcc g++ libpng-dev nodejs-npm && \
    echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories && \
    apk update && apk add --no-cache yarn

WORKDIR /app

RUN git clone -b stable https://github.com/vatesfr/xo-server && \
    git clone -b stable https://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml && \
    yarn global add node-gyp && \
    cd /app/xo-server && yarn && yarn run build && yarn clean && \
    cd /app/xo-web && yarn && yarn run build && yarn clean && \
    yarn global remove node-gyp && \
    mv /app/xo-web/dist /app && rm -rf /app/xo-web && mv /app/dist /app/xo-web && \
    apk del --no-cache build-base git curl python make gcc g++ libpng-dev && \
    rm -rf /tmp/* /var/cache/apk/*

ADD files/config.yaml /app/xo-server/.xo-server.yaml
ADD files/entrypoint.sh /

RUN chmod +x /entrypoint.sh && \
    addgroup -S xenorchestra && adduser -S -g xenorchestra xenorchestra

EXPOSE 8080

ENV USER=xenorchestra USER_HOME=/app

VOLUME /app/data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["yarn", "start"]
