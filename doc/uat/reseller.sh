export PREFIX_ETCD=/a01/nginx/reseller
export domain=gsapi.gs001.dev.gj

etcdctl put $PREFIX_ETCD/type/$domain "reseller"
etcdctl put $PREFIX_ETCD/domain/$domain $domain
etcdctl put $PREFIX_ETCD/header/$domain/Host $domain
etcdctl put $PREFIX_ETCD/domain/$domain/local "reseller.gjsoft.co"
etcdctl put $PREFIX_ETCD/upstream/$domain/1 "172.24.10.164"
etcdctl put $PREFIX_ETCD/subfilter/$domain/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$domain/Cdn2Redirect 'cdn2.gjsoft.co'
