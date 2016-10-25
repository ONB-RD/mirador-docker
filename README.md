# mirador-docker
A simple dockerization of the Mirador Viewer

This is a simple Dockerfile that builds a docker container that runs the Mirador Viewer.

The image is on Dockerhub under the name [onbrd/mirador](https://hub.docker.com/r/onbrd/mirador/) and can be pulled freely or you can clone this repository and build it yourself.

Run it using the -p parameter to specify the port. The default port for Mirador is 8000.

**Running example:** 'docker run --name mirador -p 8888:8000 -it coy123/mirador'
This example binds the port to 8888 and names the container 'mirador'. Mirador Viewer can be accessed at [localhost:8888].
