# Xen Orchestra Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-9-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Size](https://img.shields.io/badge/docker%20size-198%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.5-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Xen Orchestra Version](https://img.shields.io/badge/xo%20version-v5.7.0-green.svg?maxAge=2592000?style=flat-square)](https://xen-orchestra.com/)


This Docker image [(yobasystems/alpine-xen-orchestra)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) using the 5.7.0 version of [Xen Orchestra](https://xen-orchestra.com/).

## Features

  * Minimal size only 198 MB and only 9 layers
  * Memory usage is minimal on Alpine rather than using Debian
  * Xen Orchestra version 5.7.0
  * Armv7 (armhf) version with ```:armhf``` tag

## Tags

  * ```:latest``` latest nginx & alpine
  * ```:master``` master branch usually inline with latest
  * ```:v0.0.0``` version number related to nginx version
  * ```:armhf``` Armv7 based on latest tag but arm architecture

## Creating an instance


## Getting Started

To forward all external traffic from port 80 to the container’s port 8080

```sh
$ docker run -d --name xen-orchestra -p 80:8080 yobasystems/alpine-xen-orchestra
```

Point your browser to `http://host-ip`.

## Environment Variables:


### Main Xen parameters:

* Check the config.yaml file for options, or leave for defaults.

## Docker Compose example:

```yalm
webapp:
  image: yobasystems/alpine-xen-orchestra:latest
  expose:
    - "8080"
  volumes:
    - /data/xen-orchestra:/app/data
  restart: always
```

## Source Repository

* [Bitbucket - yobasystems/alpine-xen-orchestra](https://bitbucket.org/yobasystems/alpine-xen-orchestra/)

* [Github - yobasystems/alpine-xen-orchestra](https://github.com/yobasystems/alpine-xen-orchestra)

## Links

* [Yoba Systems](https://www.yobasystems.co.uk/)

* [Dockerhub - yobasystems](https://hub.docker.com/u/yobasystems/)

* [Quay.io - yobasystems](https://quay.io/organization/yobasystems)
