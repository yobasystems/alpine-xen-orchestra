FROM yobasystems/alpine:3.8-aarch64 as xoa-builder

WORKDIR /app

RUN apk add --no-cache bash git build-base git curl nodejs python libstdc++ make gcc g++ libpng-dev yarn

RUN git clone -b master https://github.com/vatesfr/xen-orchestra && \
    rm -rf /app/xen-orchestra/.git && \
    echo "[i] Allow config restore..." && \
    sed -i "s|process.env.XOA_PLAN < 5|process.env.XOA_PLAN > 0|" /app/xen-orchestra/packages/xo-web/src/xo-app/settings/config/index.js && \
    echo "[i] Patching github issue redirect..." && \
    sed -i "s|https://github.com/vatesfr/xen-orchestra/issues/new|https://github.com/yobasystems/alpine-xen-orchestra/issues/new|" /app/xen-orchestra/packages/xo-web/src/xo-app/about/index.js

COPY files/config.yaml xen-orchestra/packages/xo-server/.xo-server.yaml

RUN cd /app/xen-orchestra && \
    yarn && yarn build

FROM yobasystems/alpine:3.8-aarch64

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Dominic Taylor <dominic@yobasystems.co.uk>" \
    architecture="arm64v8/aarch64" \
    xenorchestra-version="5.47.0" \
    alpine-version="3.8" \
    build="20-Aug-2019" \
    org.opencontainers.image.title="alpine-xen-orchestra" \
    org.opencontainers.image.description="Xen Orchestra Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Dominic Taylor <dominic@yobasystems.co.uk>" \
    org.opencontainers.image.vendor="Yoba Systems" \
    org.opencontainers.image.version="v5.47.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/" \
    org.opencontainers.image.source="https://github.com/yobasystems/alpine-xen-orchestra" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.created=$BUILD_DATE

ENV USER=xenorchestra \
    USER_HOME=/app

RUN addgroup -S $USER && adduser -D -S -h $USER_HOME -G $USER $USER && \
    chmod +x /entrypoint.sh

RUN apk add --no-cache nodejs bash libstdc++ lvm2 nfs-utils su-exec tini util-linux && \
    rm -rf /tmp/* /var/cache/apk/*

RUN mkdir -p $USER_HOME && \
    chown $USER:$USER $USER_HOME

WORKDIR /app

COPY --from=xoa-builder /app/xen-orchestra /app/xen-orchestra
COPY --from=xoa-builder /usr/bin/node /usr/bin/
COPY --from=xoa-builder /usr/lib/libgcc* /usr/lib/libstdc* /usr/lib/
COPY files/config.yaml /app/xen-orchestra/packages/xo-server/.xo-server.yaml

COPY files/entrypoint.sh /entrypoint.sh

EXPOSE 8080

WORKDIR /app/xen-orchestra/packages/xo-server/

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh" ]

CMD ["./bin/xo-server"]
