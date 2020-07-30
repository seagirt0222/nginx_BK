#!/bin/sh
echo etcd:$ETCDCTL_ENDPOINTS
echo entrypoint:confdsync.sh

. /code/buildenv.sh

# generate configs
/usr/sbin/confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -basic-auth -username $ETCD_User -password $ETCD_Password -sync-only
