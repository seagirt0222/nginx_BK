#!/bin/sh
export NGINX_PROXY_PROTOCOL=true
export container_name="nginx_proxy_check_haproxy"
export nginx_http=9080
export nginx_https=9443

config_file="docker-compose-check.yml"
#container_name=`cat $config_file| grep container_name| awk '{print $2}'`

echo "container name: $container_name"

#docker-compose -f $config_file config
#exit

# backup current image version
docker tag nginx_proxy:check nginx_proxy:check.1

docker-compose -f $config_file build --no-cache

# start container

echo
echo "stop container [$container_name]"
docker stop $container_name && docker rm $container_name

echo
echo start container $container_name
docker-compose -f $config_file up -d

echo
echo check nginx in $container_name
docker exec -i -t $container_name nginx -t

echo
echo Execute the following command to enter the container
echo docker exec -it $container_name /bin/sh
