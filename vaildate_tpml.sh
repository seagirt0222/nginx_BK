#!/bin/bash
cat env/val.env >.env
export NGINX_APP_HTTPS_PORT=2443
rm -fr test_result
mkdir test_result

config_file="docker-compose-dev.yml"
container_name=$(cat $config_file | grep container_name | awk '{print $2}')

echo "container name: [$container_name]"

docker-compose -f $config_file up -d etcd0
sh test/Data/etcd_portal.sh
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
# docker-compose -f $config_file up -d proxy_dev
docker-compose -f $config_file run --entrypoint "" --name $container_name proxy_dev sh -c "/code/confdsync.sh"

# docker rm -f /nginx_proxy_dev
# docker run --name nginx_proxy_dev -e ETCDCTL_ENDPOINTS=http://172.16.238.10:2379 --env-file .env -v ${PWD}/nginx/conf.d:/etc/nginx/conf.d --entrypoint "" --network nginx_etcd_net nginx_proxy:dev sh -c "/code/confdsync.sh"

# docker rm -f /nginx_proxy_dev
# docker run --name nginx_proxy_dev -i -t -e ETCDCTL_ENDPOINTS=http://172.16.238.10:2379 --env-file .env-debug -v ${PWD}/nginx/conf.d:/etc/nginx/conf.d --entrypoint "" --network nginx_etcd_net nginx_proxy:dev /bin/sh

echo
echo Execute the following command to enter the container
echo "docker exec -it $container_name /bin/sh"

compareFile() {
    echo Verification template for $1
    file1=$2
    file2=$3
    val_path=$(cmp $file1 $file2)

    echo "cmp $file1 $file2"

    #echo val $val_path
    if $val_path; then
        printf '\033[0;32;32meq %s, %s \n \033[0m\n' "$file1" "$file2"
    else
        printf '\033[31mnot eq %s, %s\n \033[0m\n' "$file1" "$file2"
        diff $file2 $file1
    fi
}

# verification template
echo "verification template"
compareFile "portal" "test_result/nginx/conf.d/a01.portal.conf" "val_result/nginx/conf.d/a01.portal.conf"
compareFile "mobile" "test_result/nginx/conf.d/a01.mobile.conf" "val_result/nginx/conf.d/a01.mobile.conf"
compareFile "master" "test_result/nginx/conf.d/a01.master.conf" "val_result/nginx/conf.d/a01.master.conf"
compareFile "cdn" "test_result/nginx/conf.d/a01.cdn.conf" "val_result/nginx/conf.d/a01.cdn.conf"
compareFile "redirect" "test_result/nginx/conf.d/a01.redirect.conf" "val_result/nginx/conf.d/a01.redirect.conf"
compareFile "reseller" "test_result/nginx/conf.d/a01.reseller.conf" "val_result/nginx/conf.d/a01.reseller.conf"
compareFile "app" "test_result/nginx/conf.d/a01.app.conf" "val_result/nginx/conf.d/a01.app.conf"
compareFile "portalapi" "test_result/nginx/conf.d/a01.portalapi.conf" "val_result/nginx/conf.d/a01.portalapi.conf"
