FROM alpine:latest

MAINTAINER creedowl

RUN apk add --no-cache --update aria2 && \
        mkdir -p /aria2/dl && \
        mkdir /aria2/web && \
        mkdir /aria2/log && \
        wget http://192.168.6.235:2015/caddy && \
        mv caddy /usr/bin/ && \
        # wget https://github.com/ziahamza/webui-aria2/archive/master.zip && \
        wget http://192.168.6.235:2015/master.zip && \
        unzip master.zip&& \
        rm -rf master.zip && \
        mv webui-aria2-master/* /aria2/web && \
        rm -rf webui-aria2-master && \
        chmod +x /usr/bin/caddy


ADD ./aria2.conf /aria2/

ADD ./Caddyfile /aria2/web/

ADD ./start.sh /

EXPOSE 80

VOLUME /aria2/dl

CMD ["sh", "start.sh"]

