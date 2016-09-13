# Xen Orchestra Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-11-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Size](https://img.shields.io/badge/docker%20size-17.1%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) [![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-xen-orchestra.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.4-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Xen Orchestra Version](https://img.shields.io/badge/xo%20version-v5.2-green.svg?maxAge=2592000?style=flat-square)](http://nginx.org/en/)



This Docker image [(yobasystems/alpine-xen-orchestra)](https://hub.docker.com/r/yobasystems/alpine-xen-orchestra/) is based on the minimal [Alpine Linux](http://alpinelinux.org/)  using the 5.2 version of [Xen Orchestra](https://xen-orchestra.com/).

## Features

  * Minimal size only 17.1 MB and only 11 layers
  * Memory usage is minimal on a simple install
  * Xen Orchestra version 5.2
  * Memory usage is very small on a simple install.


## Creating an instance


## Getting Started

To forward all external traffic from port 80 to the container’s port 8080

```sh
$ docker run -d --name xen-orchestra -p 80:8080 yobasystems/alpine-xen-orchestra
```

Point your browser to `http://host-ip`.

## Environment Variables:


### Main Xen parameters:
* `URL`: specify the url with http:// or https://



# Debian
 A version of this container that is based on Debian Jessie can be found in the debian branch, or on dockerhub at adamant/xen-orchestra:debian
