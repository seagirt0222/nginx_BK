#!/bin/bash
cat env/dev.env > .env

rm -fr test_result

config_file="docker-compose-dev.yml"
container_name=`cat $config_file| grep container_name| awk '{print $2}'`

echo "container name: [$container_name]"

#docker-compose -f $config_file config
#exit

# backup current image version
docker tag nginx_proxy:dev nginx_proxy:dev.1

docker-compose -f $config_file build --no-cache

# start container

echo
echo "stop container [$container_name]"
docker stop $container_name && docker rm $container_name

echo
echo start container $container_name
docker-compose -f $config_file up -d

echo
echo Execute the following command to enter the container
echo "docker exec -it $container_name /bin/sh"
