# Xen Orchestra Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-9-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Size](https://img.shields.io/badge/docker%20size-365%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.4-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Xen Orchestra Version](https://img.shields.io/badge/xo%20version-v5.2.5-green.svg?maxAge=2592000?style=flat-square)](http://nginx.org/en/)



This Docker image [(yobasystems/alpine-xen-orchestra)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) using the 5.2.5 version of [Xen Orchestra](https://xen-orchestra.com/).

## Features

  * Minimal size only 365 MB and only 9 layers
  * Memory usage is minimal rather than using debian OS
  * Xen Orchestra version 5.2.5


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
