export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/admin

# cdn - admin
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# admin.gjsoft.co
export DOMAIN=admin.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "admin"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "admin.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "admin.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# admin.dev.gj
export DOMAIN=admin.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "admin"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "admin.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "admin.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
