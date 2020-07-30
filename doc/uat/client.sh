source ./env.sh

export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/client



# maintain
# etcdctl put $PREFIX_ETCD/type/maintain "maintain"
# etcdctl put $PREFIX_ETCD/domain/maintain "maintain.gjsoft.co"
# etcdctl put $PREFIX_ETCD/header/maintain/Host "maintain.gjsoft.local"
# etcdctl put $PREFIX_ETCD/upstream/maintain/1 "maintain.gjsoft.local"

# client
export DOMAIN=client
etcdctl put $PREFIX_ETCD/type/client "client"
etcdctl put $PREFIX_ETCD/domain/client "client.gjsoft.co"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "client.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/client/Host "client.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/client/1 "client.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

# design
export DOMAIN=design
etcdctl put $PREFIX_ETCD/type/$DOMAIN "design"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "design.gjsoft.co"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "design.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/design/Host "design.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "design.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

# pay123.allnetgame.com
export DOMAIN=pay123.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "pay"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "pay123.allnetgame.com"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "pay.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "pay.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "pay.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

# paytest.allnetgame.com
export DOMAIN=paytest.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "pay"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "paytest.allnetgame.com"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "paytest.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "paytest.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "pay.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

# deploy.allnetgame.com
export DOMAIN=deploy.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "deploy"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "deploy.allnetgame.com"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "deploy.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "deploy.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "deploy.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

 etcdctl get $PREFIX_ETCD/ --prefix
