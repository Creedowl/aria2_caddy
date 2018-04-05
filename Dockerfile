FROM smebberson/alpine-nginx

MAINTAINER creedowl

RUN apk update && \
        apk add --update wget && \
        apk add --no-cache --update aria2 && \
        mkdir -p /aria2/dl && \
        rm -rf /usr/html && \
        wget https://github.com/ziahamza/webui-aria2/archive/master.zip && \
        unzip master.zip && \
        mv webui-aria2-master /usr/html && \
        rm -rf master.zip

ADD ./aria2.conf /aria2/

ADD ./default.conf /etc/nginx/conf.d/

EXPOSE 80

VOLUME /aria2/dl

CMD ["aria2c", "--conf-path=/aria2/aria2.conf"]

