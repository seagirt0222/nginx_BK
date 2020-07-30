export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://etcd0:2379
export PREFIX_ETCD=/a01/nginx/agent

# cdn - agent
#etcdctl put $PREFIX_ETCD/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put $PREFIX_ETCD/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# agent.gjsoft.co
export DOMAIN=agent.gjsoft.co
etcdctl put $PREFIX_ETCD/type/$DOMAIN "agent"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "agent.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "agent.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "agent.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'


# agent.dev.gj
export DOMAIN=agent.dev.gj
etcdctl put $PREFIX_ETCD/type/$DOMAIN "agent"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "agent.ac001.gjsoft.local"
# etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "agent.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "agent.ac001.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'


export DOMAIN=agent.kzhn.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "agent"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "agent.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "agent.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "agent.ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl get $PREFIX_ETCD/ --prefix
