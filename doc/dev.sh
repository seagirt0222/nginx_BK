export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://localhost:2379

# test
for t in "portal" "mobile" "agent" "master" "admin"
do
    PREFIX_ETCD=/a01/nginx/$t
    domain=www.$t.gjsoft.local

    etcdctl put $PREFIX_ETCD/type/$domain "$t"
    etcdctl put $PREFIX_ETCD/domain/$domain "$domain"
    etcdctl put $PREFIX_ETCD/header/$domain/Host "www.$t.gjsoft.local"
    etcdctl put $PREFIX_ETCD/domain/$domain/local "$t.gjsoft.local"

    etcdctl put $PREFIX_ETCD/upstream/$domain/1 "localhost"
   
    etcdctl put $PREFIX_ETCD/subfilter/$domain/CdnRedirect 'localhost'
    etcdctl put $PREFIX_ETCD/subfilter/$domain/Cdn2Redirect 'localhost'
    
    etcdctl put $PREFIX_ETCD/maintain/$domain/ ''
    etcdctl put $PREFIX_ETCD/maintain/$domain/url 'http://localhost/maintain/url'
done
