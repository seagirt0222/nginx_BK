export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/portal

# pay123.allnetgame.com
# DOMAIN=pay123.allnetgame.com
# etcdctl put $PREFIX_ETCD/type/$DOMAIN "portal"
# etcdctl put $PREFIX_ETCD/domain/$DOMAIN "~^(?<wwwhost>pay123)\.(?<area>allnetgame\.com)"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "pay.gjsoft.local"
# etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "pay.gjsoft.local"
# etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "pay.gjsoft.local"

# DOMAIN=pay123.allnetgame.com
# etcdctl del $PREFIX_ETCD/type/$DOMAIN
# etcdctl del $PREFIX_ETCD/domain/$DOMAIN
# etcdctl del $PREFIX_ETCD/header/$DOMAIN/Host
# etcdctl del $PREFIX_ETCD/domain/$DOMAIN/local
# etcdctl del $PREFIX_ETCD/upstream/$DOMAIN/1

# etcdctl get $PREFIX_ETCD/ --prefix
