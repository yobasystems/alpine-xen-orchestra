# Xen Orchestra Docker image running on Alpine Linux

[![Docker Automated build](https://img.shields.io/docker/automated/yobasystems/alpine-caddy.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-caddy/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-caddy.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-caddy/)
[![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-caddy.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-caddy/)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.8-green.svg?style=for-the-badge)](https://alpinelinux.org/)
[![Caddy Version](https://img.shields.io/badge/XO%20version-v5.47.0-green.svg?style=for-the-badge)](https://xen-orchestra.com/)

This Docker image [(yobasystems/alpine-xen-orchestra)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) with [Xen Orchestra](https://xen-orchestra.com/).

##### Alpine Version 3.8.2 (Released Dec 20, 2018)
##### Xen Orchestra Version 5.47.0

----

## What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## What is Xen Orchestra?
Xen Orchestra provides a web based UI for the management and administration of XCP-ng installations without requiring any agent or extra software on your hosts nor VMs. The primary goal of XO is to provide a unified management panel for a complete XCP-ng infrastructure, regardless of pool size and quantity of pools. For those seeking a web based replacement for XCP-ng Center, Xen Orchestra fully supports VM lifecycle operations such as VM creation, migration or console access directly from a browser. Xen Orchestra extends the capabilities of XCP-ng to also provide delegated resource access, delta backup, continuous replication, performance graphs and visualisations.

[More Info](https://xen-orchestra.com/#!/xo-home) | [Pro Support](https://xen-orchestra.com/#!/xo-pricing) (Highly recommended) | [Source Code](https://github.com/vatesfr/xen-orchestra)

_ (May also work with Citrix Xenserver but XCP-ng is the better choice) _

### What is XCP-ng?
Based on XenServer, XCP-ng is the result of massive cooperation between individuals and companies, to deliver a product without limits. No restrictions on features and every bit available on GitHub! XCP-ng is a turnkey open source virtualisation platform.

[More Info](https://xcp-ng.org/) | [Download .iso](http://mirrors.xcp-ng.org/isos/8.0/xcp-ng-8.0.0.iso) | [Source Code](https://github.com/xcp-ng/xcp)


## Features

* Minimal size & layers
* Memory usage is minimal on Alpine rather than using Debian
* Xen Orchestra version 5.47.0

## Architectures

* ```:amd64```, ```:latest``` - 64 bit Intel/AMD (x86_64/amd64)
* ```:arm64v8```, ```:aarch64``` - 64 bit ARM (ARMv8/aarch64)
* ```:arm32v7```, ```:armhf``` - 32 bit ARM (ARMv7/armhf)

#### PLEASE CHECK TAGS BELOW FOR SUPPORTED ARCHITECTURES, THE ABOVE IS A LIST OF EXPLANATION

## Tags

* ```:latest``` latest branch based (Automatic Architecture Selection)
* ```:master``` master branch usually inline with latest
* ```:v5.47.0``` version number related to xen orchestra version (Automatic Architecture Selection)
* ```:armhf```, ```:arm32v7``` Armv7 based on latest tag but arm architecture
* ```:aarch64```, ```:arm64v8``` Armv8 based on latest tag but arm64 architecture

## Environment Variables:

### Main Xen Orchestra parameters:

* Check the config.yaml file for options, or leave for defaults.

## Creating an instance

A redis container is required, e.g redis:alpine or yobasystems/alpine-redis to be linked to the Xen Orchestra container. Check the docker compose example for more info.

### Getting Started

Build local image:

## Docker Compose example:

```yalm
version: '2'
services:
    xen-orchestra:
        build: .
        command: ./bin/xo-server
        container_name: xoa
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

* [Github - yobasystems/alpine-xen-orchestra](https://github.com/yobasystems/alpine-xen-orchestra)
