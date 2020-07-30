export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/robot

# cdn - robot
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# robot.gjsoft.co
export DOMAIN=robot.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "robot"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "robot.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "robot.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "robot.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# robot.dev.gj
export DOMAIN=robot.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "robot"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "robot.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "robot.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "robot.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
