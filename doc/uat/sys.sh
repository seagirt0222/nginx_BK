export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://172.24.10.164:2379
export PREFIX_ETCD=/a01/nginx/sys

# cdn - admin
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# admin.gjsoft.co
export DOMAIN=grafana.gjsoft.local
# export DOMAIN=phipma.allnetgame.co1
etcdctl put $PREFIX_ETCD/type/$DOMAIN "sys"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "grafana.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "172.24.10.54:3000"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

export DOMAIN=www.gstargaming.com
etcdctl put $PREFIX_ETCD/domain/$DOMAIN 'www.gstargaming.com' 
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local 'www.gjsoft.local' 
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host 'www.gstargaming.com' 
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN 'true' 
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert '/data/certs/gstargaming.com/fullchain.pem' 
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert_key '/data/certs/gstargaming.com/privkey.pem' 
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.0a0w.com' 
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.0a0w.com' 
etcdctl put $PREFIX_ETCD/type/$DOMAIN 'sys' 
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 'design.gjsoft.local'