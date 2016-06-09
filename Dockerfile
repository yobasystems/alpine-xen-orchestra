FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Adam Dodman <adam.dodman@gmx.com>

#
# DISCLAIMER
# Forked from https://github.com/jpoa/docker-xo/
# Based on the work of sammcj https://github.com/sammcj/docker-xen-orchestra
# Updated with info from https://github.com/vatesfr/xo/blob/master/doc/installation/manual_installation.md
#

# Install requirements
RUN apt-get -q update && \
    apt-get -q install build-essential redis-server libpng-dev git python-minimal curl supervisor

# Install nodeJS
RUN curl -o /usr/local/bin/n https://raw.githubusercontent.com/visionmedia/n/master/bin/n && \
        chmod +x /usr/local/bin/n && n stable

# Setup Supervisor to manage the application process
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Edit redis config, then cleanup apt, 
RUN sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
    sed -i 's/^\(dir .*\)$/# \1\ndir \/app\/data/' /etc/redis/redis.conf && \
    sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
    apt-get remove --purge curl && apt-get autoremove -qq && apt-get clean && rm -rf /usr/share/doc /usr/share/man /var/log/* /tmp/*

# Create the folder structure for XO
RUN mkdir -p /app/data

WORKDIR /app

# Clone code
RUN git clone -b stable http://github.com/vatesfr/xo-server && \
    git clone -b stable http://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml

# Build XO
RUN cd xo-server/ && npm install && npm run build && cd ..
RUN cd xo-web/ && npm install && npm run build

# Add configuration
ADD config.yaml /app/xo-server/.xo-server.yaml

EXPOSE 8080
VOLUME /app/data

CMD ["/usr/bin/supervisord"]
