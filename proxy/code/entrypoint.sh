#!/bin/sh

echo etcd:$ETCDCTL_ENDPOINTS
echo entrypoint:entrypoint.sh

. /code/buildenv.sh

# generate configs
/usr/sbin/confd -interval 10 -backend etcdv3 -node $ETCDCTL_ENDPOINTS -basic-auth -username $ETCD_User -password $ETCD_Password &

# start nginx foreground
exec /usr/sbin/nginx -g 'daemon off;'
