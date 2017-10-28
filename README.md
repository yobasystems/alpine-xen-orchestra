# Xen Orchestra Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-9-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/bastienm/alpine-xoa/) [![Docker Size](https://img.shields.io/badge/docker%20size-198%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/bastienm/alpine-xoa/) [![Docker Stars](https://img.shields.io/docker/stars/bastienm/xoa.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/bastienm/alpine-xoa/) [![Docker Pulls](https://img.shields.io/docker/pulls/bastienm/alpine-xoa.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/bastienm/alpine-xoa/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.4.0-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Xen Orchestra Version](https://img.shields.io/badge/xo%20version-v5.13.0-green.svg?maxAge=2592000?style=flat-square)](https://xen-orchestra.com/)

This Docker image [(yobasystems/alpine-xen-orchestra)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) with [Xen Orchestra](https://xen-orchestra.com/).

##### Alpine Version 3.4 (Released Apr 30, 2016)
##### Xen Orchestra Version 5.13.0

----

## What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## What is Xen Orchestra?
Xen Orchestra provides a web based UI for the management of XenServer installations without requiring any agent or extra software on your hosts nor VMs. The primary goal of XO is to provide a unified management panel for a complete XenServer infrastructure, regardless of pool size and quantity of pools. For those seeking a web based replacement for XenCenter, Xen Orchestra fully supports VM lifecycle operations such as VM creation, migration or console access directly from a browser. Xen Orchestra extends the capabilities of XenCenter to also provide delegated resource access, delta backup, continuous replication, performance graphs and visualizations.

## Features

* Minimal size only 198 MB and only 9 layers
* Memory usage is minimal on Alpine rather than using Debian
* Xen Orchestra version 5.10.5

## Architectures

* ```:amd64```, ```:latest``` - 64 bit Intel/AMD (x86_64/amd64)
* ```:i386```, ```:x86``` - 32 bit Intel/AMD (x86/i686)
* ```:arm64v8```, ```:aarch64``` - 64 bit ARM (ARMv8/aarch64)
* ```:arm32v7```, ```:armhf``` - 32 bit ARM (ARMv7/armhf)

#### PLEASE CHECK TAGS BELOW FOR SUPPORTED ARCHITECTURES, THE ABOVE IS A LIST OF EXPLANATION

## Tags

* ```:latest```, ```:amd64``` latest branch based on amd64
* ```:master``` master branch usually inline with latest
* ```:v0.0.0``` version number related to docker version
* ```:armhf```, ```:arm32v7``` Armv7 based on latest tag but arm architecture

## Environment Variables:

### Main Xen parameters:

* Check the config.yaml file for options, or leave for defaults.

## Creating an instance

A redis container is required, e.g redis:alpine to be linked to the xen orchestra container. Check docker compose example for more info.

### Getting Started

To forward all external traffic from port 80 to the container’s port 8080

```sh
$ docker run -d --name xen-orchestra -p 80:8080 yobasystems/alpine-xen-orchestra yarn start
```

Point your browser to `http://host-ip`.

## Docker Compose example:

```yalm
version: '2'
services:
    xen-orchestra:
        image: yobasystems/alpine-xen-orchestra:latest
        container_name: xoa
        command: yarn start
        ports:
            - "8000:8080"
        depends_on:
            - redis
        environment:
            - NODE_ENV=production
        volumes:
            - /data/xoa/server:/app/data
    redis:
        container_name: xoa-redis
        image: redis:alpine
        command: redis-server --appendonly yes
        volumes:
            - /data/xoa/redis:/data
```

## Source Repository

* [Bitbucket - yobasystems/alpine-xen-orchestra](https://bitbucket.org/yobasystems/alpine-xen-orchestra/)

* [Github - yobasystems/alpine-xen-orchestra](https://github.com/yobasystems/alpine-xen-orchestra)

## Links

* [Yoba Systems](https://www.yobasystems.co.uk/)

* [Dockerhub - yobasystems](https://hub.docker.com/u/yobasystems/)

* [Quay.io - yobasystems](https://quay.io/organization/yobasystems)
