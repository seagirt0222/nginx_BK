export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/robotcenter

# cdn
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# robotcenter.gjsoft.co
export DOMAIN=robotcenter.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "robotcenter"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "robotcenter.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "robotcenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "robotcenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# robotcenter.dev.gj
export DOMAIN=robotcenter.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "robotcenter"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "robotcenter.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "robotcenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "robotcenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
