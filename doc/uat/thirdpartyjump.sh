export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/thirdpartyjump

# cdn - thirdpartyjump
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'


# thirdpartyjump.gjsoft.co
export DOMAIN=thirdpartyjump.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "thirdpartyjump"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "thirdpartyjump.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "thirdpartyjump.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "thirdpartyjump.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# thirdpartyjump.dev.gj
export DOMAIN=thirdpartyjump.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "thirdpartyjump"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "thirdpartyjump.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "thirdpartyjump.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "thirdpartyjump.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
