# docker-xo

Simple docker file to build an up-to-date Xen Orchestra container.

# Run it!

## To forward all external traffic from port 80 to the container’s port 8080
`docker run -p 0.0.0.0:80:8080 adamant/xen-orchestra`


# Notes

In theory, with the new XO 4.X, it is possible to update the code through the web interface so this image might still be relevant in the future.

Since all the other images on the hub were for older versions of XO, I adapted one of them (sammcj & jpoa) to match the newest version (4.17 as of 9/6/16).

Nothing fancy here, just getting the needed dependencies and code from the sources and building the project (check the docker file).
