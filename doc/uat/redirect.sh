export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/redirect

# cdn

# GJ001 --------------------------------------------------------------------------------------------------------------
# test portal ssl
etcdctl put $PREFIX_ETCD/domain/www.demo.allnetgame.com "gba911.com"
etcdctl put $PREFIX_ETCD/subfilter/www.demo.allnetgame.com/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/www.demo.allnetgame.com/Cdn2Redirect 'cdn2.gjsoft.co'
