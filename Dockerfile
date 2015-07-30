FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

#
# DISCLAIMER
# Based on the work of sammcj https://github.com/sammcj/docker-xen-orchestra
# Updated with info from https://github.com/vatesfr/xo/blob/master/doc/installation/manual_installation.md
#

# Prepare the system to run XO as non-root
RUN useradd -d /app -r app && \
    mkdir -p /static /storage /app/conf && \
    chown -R app /static /storage /app

WORKDIR /app

# Install requirements
RUN apt-get -qq update && \
    apt-get -qq install build-essential redis-server libpng-dev git python-minimal curl supervisor && \
    apt-get autoremove -qq && apt-get clean && rm -rf /usr/share/doc /usr/share/man /var/log/* /tmp/*

# Install nodeJS
RUN curl -o /usr/local/bin/n https://raw.githubusercontent.com/visionmedia/n/master/bin/n && \
        chmod +x /usr/local/bin/n && n stable

# Clone code
RUN git clone --depth=1 http://github.com/vatesfr/xo-server && \
    git clone --depth=1 http://github.com/vatesfr/xo-web && \
    rm -rf xo-server/.git xo-web/.git xo-server/sample.config.yaml

# Build XO
RUN cd xo-server/ && npm install && npm run build && cd ..
RUN cd xo-web/ && npm install && npm run build

# Add configuration
ADD sample.config.yaml /app/xo-server/.xo-server.yaml

# Setup Supervisor to manage the application process
COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
