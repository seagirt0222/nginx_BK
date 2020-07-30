export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/gamejump

# cdn
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# gamejump.gjsoft.co
export DOMAIN=gamejump.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "gamejump"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "gamejump.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "gamejump.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "gamejump.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# gamejump.dev.gj
export DOMAIN=gamejump.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "gamejump"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "gamejump.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "gamejump.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "gamejump.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
