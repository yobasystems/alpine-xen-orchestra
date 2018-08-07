FROM yobasystems/alpine:3.8-armhf as xoa-builder

WORKDIR /app

RUN apk update && \
    apk add --no-cache bash git build-base git curl nodejs python libstdc++ make gcc g++ libpng-dev yarn

RUN git clone -b master https://github.com/vatesfr/xen-orchestra

COPY files/config.yaml xen-orchestra/packages/xo-server/.xo-server.yaml

RUN cd /app/xen-orchestra && \
    yarn && yarn build

FROM yobasystems/alpine:3.8-armhf

LABEL maintainer "Dominic Taylor <dominic@yobasystems.co.uk>" architecture="AMD64/x86_64" date="07-aug-2017"

ENV USER=xenorchestra \
    USER_HOME=/app

RUN apk update -U && \
    apk add -U nodejs yarn bash libstdc++ lvm2 nfs-utils su-exec tini util-linux && \
    rm -rf /tmp/* /var/cache/apk/*

COPY --from=xoa-builder /app/xen-orchestra /app/xen-orchestra

COPY files/entrypoint.sh /entrypoint.sh

VOLUME /app/data

RUN addgroup -S $USER && adduser -S -g $USER $USER && \
    chmod +x /entrypoint.sh

EXPOSE 8080

USER xenorchestra

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh" ]
CMD ["yarn", "start"]
