# docker-xo

Simple docker file to build an up-to-date Xen Orchestra container.

In theory, with the new XO 4.X, it is possible to update the code through the web interface. Since all the other Dockerfiles on the hub were for older versions I adapted one ([sammcj][1]) of them to match the newest version.

Nothing fancy here, just getting the needed dependencies and code from the sources and building the code (check the docker file).

Eventually you might be able to make the image smaller and so. Feel free to clone, PR or merge the changes upstream (to other repos).

# Run it!

## To forward all external traffic from port 18080 to the container’s port 80
docker run -p 0.0.0.0:18080:80 jpoa/docker-xo

You can obviously start the container with other options, this is just the quick startup.

[1]:	https://github.com/sammcj/docker-xen-orchestra "sammck"