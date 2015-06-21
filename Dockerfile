FROM alpine:3.1
MAINTAINER Widi Harsojo <https://github.com/wharsojo>

ENV DOCKER_COMPOSE_VERSION 1.3.0

RUN apk --update add py-pip py-yaml &&\
    pip install -U docker-compose==${DOCKER_COMPOSE_VERSION} &&\
    rm -rf `find / -regex '.*\.py[co]' -or -name apk`

# chrooted
WORKDIR /app
ENTRYPOINT ["/usr/bin/docker-compose"]
CMD ["--version"]