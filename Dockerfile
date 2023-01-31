## Defines the base of the image you are creating
## You can start from parent image or a base image.
## When using a parent image, you are using an existing image on which you base a new one.
## Using a base image means you are starting from scratch - use FROM scratch

# ???????????? I don’t know which parent image to use for your Java app ??????????????????
#L ink refer: https://tomd.xyz/java-docker-parent-image/

FROM openjdk:8-jdk-alpine

## Specifies the author of the image
LABEL maintainer="lethaiduy0202@gmail.com"


## Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile.
WORKDIR /app
# Format: COPY <src> <dest>
# copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>
COPY pom.xml /app/


# Install maven
RUN apk add --no-cache maven

# Run mvn clean install to build the project and download dependencies
RUN mvn clean install -Dlicense.skip=true

# Use an existing image for Jetty as the base image
FROM jetty:9.4.50-jre8

# Copy the built jar file from the previous image to the Jetty image
# COPY /app/*.war /var/lib/jetty/webapps/

# Expose port 9999
EXPOSE 9999

## provide defaults for an executing container.
## format: ["executable","param1","param2"]
CMD ["mvn","jetty:run","-Djetty.http.port=9999"]


#LABEL
#EXPOSE
#ENV
#ADD
#ENTRYPOINT
#VOLUME
#USER
#WORKDIR
#ARG
#STOPSIGNAL
#HEALTHCHECK
#SHELL