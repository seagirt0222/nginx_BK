confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -basic-auth -username $ETCD_User -password $ETCD_Password -sync-only
nginx -t && nginx -s reload
