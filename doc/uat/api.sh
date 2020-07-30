export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/api

# cdn - api
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# api.gjsoft.co
export DOMAIN=api.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "api"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "api.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "api.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "api.ac001.gjsoft.local"

etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# api.dev.gj
export DOMAIN=api.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "api"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "api.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "api.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "api.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
