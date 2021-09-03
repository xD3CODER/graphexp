FROM nginx:stable-alpine

LABEL maintainer="nathan.kremer@efrei.net"

ENV http_proxy $http_proxy
ENV https_proxy $https_proxy
ENV no_proxy $no_proxy
ENV PATH /usr/local/bin:$PATH


RUN apk add wget unzip && \
    cd /tmp && \
    wget  https://github.com/xd3coder/graphexp/archive/master.zip && \
    unzip master.zip && \
    sed 's/const HOST = "localhost"/const HOST = self.location.hostname/' graphexp-master/scripts/graphConf.js > graphConf.js && \
    sed 's/const HOST = "localhost"/const HOST = self.location.hostname/' graphexp-master/scripts/graphConf.js > graphConf.js && \
    mv graphConf.js graphexp-master/scripts && \
    mv graphexp-master/*  /usr/share/nginx/html && \
    rm -R /tmp/graphexp-master && \
    apk del wget unzip




WORKDIR  /usr/share/nginx/html




