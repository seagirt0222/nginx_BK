export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/apicenter

# cdn
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/apicenter.citest.gjsoft.local/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/apicenter.citest.gjsoft.local/Cdn2Redirect 'cdn2.gjsoft.co'

# apicenter.gjsoft.co
export DOMAIN=apicenter.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "apicenter"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "apicenter.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "apicenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "apicenter.gjsoft.local"

etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'


# apicenter.dev.gj
export DOMAIN=apicenter.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "apicenter"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "apicenter.dev.gj"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "apicenter.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "apicenter.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "apicenter.gjsoft.local"

etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/1 "172.24.10.0/24"
etcdctl put $PREFIX_ETCD/ipdeny/$DOMAIN/1 "all"

etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
