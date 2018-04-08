FROM alpine:latest

MAINTAINER creedowl

RUN apk add --no-cache --update aria2 && \
        mkdir -p /aria2/dl && \
        mkdir /aria2/web && \
        mkdir /aria2/log && \
        # wget http://192.168.6.235:2015/caddy && \
        wget -O caddy.tar.gz https://caddyserver.com/download/linux/amd64?plugins=http.filemanager&license=personal && \
        tar -xzf caddy.tar.gz caddy && \
        mv caddy /usr/bin/ && \
        chmod +x /usr/bin/caddy && \
        wget https://github.com/ziahamza/webui-aria2/archive/master.zip && \
        # wget http://192.168.6.235:2015/master.zip && \
        unzip master.zip&& \
        rm -rf master.zip && \
        mv webui-aria2-master/* /aria2/web && \
        rm -rf webui-aria2-master



ADD ./aria2.conf /aria2/

ADD ./Caddyfile /aria2/web/

ADD ./start.sh /

EXPOSE 80

VOLUME /aria2/dl

CMD ["sh", "start.sh"]

