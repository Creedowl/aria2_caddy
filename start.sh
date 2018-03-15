#!/bin/sh
wget https://github.com/ziahamza/webui-aria2/archive/master.zip
unzip master.zip
rm -rf /etc/html/*
mv ./webui-aria2-master/* /etc/html
rm -rf master.zip
rm -rf webui-aria2-master
aria2c --config-path=/aria2/aria2.conf
