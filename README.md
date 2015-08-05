# docker-xo

Simple docker file to build an up-to-date Xen Orchestra container.

# Run it!

## To forward all external traffic from port 18080 to the container’s port 80
docker run -p 0.0.0.0:18080:80 jpoa/xen-orchestra

You can obviously start the container with other options, this is just the quick startup.

# Notes

In theory, with the new XO 4.X, it is possible to update the code through the web interface so this image might still be relevant in the future.

Since all the other images on the hub were for older versions of XO, I adapted one of them (sammcj) to match the newest version (4.3).

Nothing fancy here, just getting the needed dependencies and code from the sources and building the project (check the docker file).

Eventually you might be able to make the image smaller and so on. Feel free to clone, PR or merge the changes upstream (to other repos).

