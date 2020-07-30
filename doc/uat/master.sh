export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/master

# cdn - master
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'


# master.gjsoft.co
export DOMAIN=master.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "master"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# master.allnetgame.com
export DOMAIN=master.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "master"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

# master.dev.gj
export DOMAIN=master.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "master"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "master.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "master.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix


export DOMAIN=master.kzhn.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "master"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "master.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "master.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "master.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
