#!/bin/sh
cd /aria2/web
aria2c --conf-path=/aria2/aria2.conf &
caddy

