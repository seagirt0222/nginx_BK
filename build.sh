#!/bin/sh 

docker tag nginx_proxy:bak.1 nginx_proxy:bak.2
docker tag nginx_proxy:latest nginx_proxy:bak.1

docker-compose -f docker-compose.yml build
