export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://172.24.10.164:2379
export PREFIX_ETCD=/a01/nginx/cdn

# cdn 1 + ssl
etcdctl put $PREFIX_ETCD/type/cdn1.gjsoft.co "cdn"
etcdctl put $PREFIX_ETCD/domain/cdn1.gjsoft.co "cdn1.gjsoft.co"
etcdctl put $PREFIX_ETCD/domain/cdn1.gjsoft.co/local "cdn1.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/cdn1.gjsoft.co/Host "cdn1.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/cdn1.gjsoft.co/1 "cdn1.gjsoft.local"

etcdctl put $PREFIX_ETCD/subfilter/cdn1.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/cdn1.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'

# cdn1 enabled ssl
etcdctl put $PREFIX_ETCD/ssl/cdn1.gjsoft.co 'true'
etcdctl put $PREFIX_ETCD/ssl/cdn1.gjsoft.co/cert '/data/certs/cdn1.gjsoft.co/fullchain.pem'
etcdctl put $PREFIX_ETCD/ssl/cdn1.gjsoft.co/cert_key '/data/certs/cdn1.gjsoft.co/privkey.pem'

# cdn 2 + ssl
etcdctl put $PREFIX_ETCD/type/cdn2.gjsoft.co "cdn"
etcdctl put $PREFIX_ETCD/domain/cdn2.gjsoft.co "cdn2.gjsoft.co"
etcdctl put $PREFIX_ETCD/domain/cdn2.gjsoft.co/local "cdn2.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/cdn2.gjsoft.co/Host "cdn2.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/cdn2.gjsoft.co/1 "cdn2.gjsoft.local"

etcdctl put $PREFIX_ETCD/subfilter/cdn2.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/cdn2.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://172.24.10.164:2379
export PREFIX_ETCD=/a01/nginx/cdn
# cdn2 enabled ssl
etcdctl put $PREFIX_ETCD/ssl/cdn2.gjsoft.co 'true'
etcdctl put $PREFIX_ETCD/ssl/cdn2.gjsoft.co/cert '/data/certs/cdn1.gjsoft.co/fullchain.pem'
etcdctl put $PREFIX_ETCD/ssl/cdn2.gjsoft.co/cert_key '/data/certs/cdn1.gjsoft.co/privkey.pem'




export DOMAIN=cdn1.gstargaming.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "cdn"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "cdn1.gstargaming.com"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "cdn1.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "cdn1.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "cdn1.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gstargaming.com'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gstargaming.com'
# cdn enabled ssl
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert '/data/certs/cdn1.gstargaming.com/fullchain.pem'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert_key '/data/certs/cdn1.gstargaming.com/privkey.pem'

export DOMAIN=cdn2.gstargaming.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "cdn"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "cdn2.gstargaming.com"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "cdn2.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "cdn2.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "cdn2.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gstargaming.com'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gstargaming.com'
# cdn enabled ssl
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert '/data/certs/cdn2.gstargaming.com/fullchain.pem'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert_key '/data/certs/cdn2.gstargaming.com/privkey.pem'


