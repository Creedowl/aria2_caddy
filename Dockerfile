FROM smebberson/alpine-nginx

MAINTAINER creedowl

ADD ./aria2.conf /aria2/

ADD ./default.conf /etc/nginx/conf.d/

RUN apk update && \
        apk add --update wget && \
        apk add --no-cache --update aria2 && \
        mkdir -p /aria2/dl && \
        rm -rf /usr/html && \
        wget https://github.com/ziahamza/webui-aria2/archive/master.zip && \
        unzip master.zip && \
        mv webui-aria2-master /usr/html

EXPOSE 80

CMD ["aria2c", "--conf-path=/aria2/aria2.conf"]

