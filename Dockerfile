## Defines the base of the image you are creating
## You can start from parent image or a base image.
## When using a parent image, you are using an existing image on which you base a new one.
## Using a base image means you are starting from scratch - use FROM scratch

#???????????? I don’t know which parent image to use for your Java app ??????????????????
#Link refer: https://tomd.xyz/java-docker-parent-image/

FROM maven:3.8-openjdk-8 as build

##Specifies the author of the image
MAINTAINER lethaiduy0202@gmail.com


## Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.
WORKDIR /app

#Format: COPY <src> <dest>
# copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
COPY

##provide defaults for an executing container.
##format: ["executable","param1","param2"]
CMD ["mvn","jetty:run","-Djetty.http.port=9999"]


#LABEL
#EXPOSE
#ENV
#ADD
#RUN
#ENTRYPOINT
#VOLUME
#USER
#WORKDIR
#ARG
#STOPSIGNAL
#HEALTHCHECK
#SHELL