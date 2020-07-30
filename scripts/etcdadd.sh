#!/bin/sh
export ETCDCTL_ENDPOINTS=http://172.24.10.88:2379
export ETCDCTL_API=3
path=/a01/nginx/redirect/domain/

#echo "etcdctl get $path --prefix --keys-only=true | sed 's,$path,,g'"
key=$(etcdctl get $path --prefix --keys-only=true |grep -v $path'.*/'| sed 's,'$path',,g')
#echo $key

for x in $key; do
    echo "################ domain Key : $x ################"

    echo "etcdctl put /a01/nginx/redirect/redirect/$x/to" '$scheme://www.'$x'$request_uri'
    etcdctl put /a01/nginx/redirect/redirect/$x/to '$scheme://www.'$x'$request_uri'

    echo "etcdctl put /a01/nginx/redirect/redirect/$x/code 301"
    etcdctl put /a01/nginx/redirect/redirect/$x/code 301
done

