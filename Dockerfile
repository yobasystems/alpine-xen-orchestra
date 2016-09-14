FROM yobasystems/alpine-nodejs:min
MAINTAINER Dominic Taylor <dominic@yobasystems.co.uk>

RUN apk update && \
    apk add --no-cache build-base redis git curl supervisor libstdc++ make gcc g++ libpng-dev

RUN mkdir -p /app/data

WORKDIR /app

RUN git clone -b stable http://github.com/vatesfr/xo-server && \
    git clone -b stable http://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml

RUN cd xo-server/ && npm install && npm run build && cd .. && \
    cd xo-web/ && npm install && npm run build && cd ..

ADD files/config.yaml /app/xo-server/.xo-server.yaml
ADD files/supervisord.conf /etc/supervisord.conf

RUN sed -i 's/daemonize yes/daemonize no/' /etc/redis.conf && \
    sed -i 's/dir \/var\/lib\/redis/dir \/app\/data/' /etc/redis.conf && \
    sed -i 's/appendonly no/appendonly yes/' /etc/redis.conf && \
    sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis.conf && \
    mv /app/xo-web/dist /app && rm -rf /app/xo-web && mv /app/dist /app/xo-web && \
    apk del --no-cache build-base git curl make gcc g++ libpng-dev

EXPOSE 8080
VOLUME /app/data

CMD ["/usr/bin/supervisord"]
