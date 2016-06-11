FROM adamant/nodejs-alpine

MAINTAINER Adam Dodman <adam.dodman@gmx.com>

#
# DISCLAIMER
# Forked from https://github.com/jpoa/docker-xo/
# Based on the work of sammcj https://github.com/sammcj/docker-xen-orchestra
# Updated with info from https://github.com/vatesfr/xo/blob/master/doc/installation/manual_installation.md
#

# Install requirements
RUN apk update && \
    apk add --no-cache build-base redis git curl supervisor libstdc++ make gcc g++ libpng-dev

#Create the folder structure for XO
RUN mkdir -p /app/data

WORKDIR /app

# Clone code
RUN git clone -b stable http://github.com/vatesfr/xo-server && \
    git clone -b stable http://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml

# Build XO
RUN cd xo-server/ && npm install && npm run build && cd ..
RUN cd xo-web/ && npm install && npm run build && cd ..

# Add configuration
ADD config.yaml /app/xo-server/.xo-server.yaml

# Setup Supervisor to manage the application process
COPY supervisord.conf /etc/supervisord.conf

#Edit redis config, then general cleanup
RUN sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis.conf && \
    sed -i 's/^\(dir .*\)$/# \1\ndir \/app\/data/' /etc/redis.conf && \
    sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis.conf && \
    mv /app/xo-web/dist /app && rm -rf /app/xo-web && mv /app/dist /app/xo-web &&\
    apk del --no-cache build-base git curl make gcc g++ libpng-dev

EXPOSE 8080
VOLUME /app/data

CMD ["/usr/bin/supervisord"]
