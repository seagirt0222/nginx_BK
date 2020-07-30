export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://127.0.0.1:2379
etcdctl get "" --prefix

echo "########################## delete Key ##########################"
etcdctl del "" --prefix

export PREFIX_ETCD_PORTAL=/a01/nginx/portal
export PREFIX_ETCD_MOBILE=/a01/nginx/mobile

# portal
export DOMAIN=www.test123.com

etcdctl put $PREFIX_ETCD_PORTAL/type/$DOMAIN "portal"
etcdctl put $PREFIX_ETCD_PORTAL/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/header/$DOMAIN/Host "www.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# portal enabled ssl
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN 'true'
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
# etcdctl put $PREFIX_ETCD_PORTAL/ipdeny/$DOMAIN/1 "all"
# allow ip
# etcdctl put $PREFIX_ETCD_PORTAL/ipallow/$DOMAIN/1 "1.1.1.1"
# etcdctl put $PREFIX_ETCD_PORTAL/ipallow/$DOMAIN/2 "2.2.2.2"

# mobile
export DOMAIN=m.test123.com
etcdctl put $PREFIX_ETCD_MOBILE/type/$DOMAIN "mobile"
etcdctl put $PREFIX_ETCD_MOBILE/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/header/$DOMAIN/Host "m.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# mobile enabled ssl
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN 'true'
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
# etcdctl put $PREFIX_ETCD_MOBILE/ipdeny/$DOMAIN/1 "all"
# allow ip
# etcdctl put $PREFIX_ETCD_MOBILE/ipallow/$DOMAIN/1 "1.1.1.1"
# etcdctl put $PREFIX_ETCD_MOBILE/ipallow/$DOMAIN/2 "2.2.2.2"



# portal
export DOMAIN=www.block.com

etcdctl put $PREFIX_ETCD_PORTAL/type/$DOMAIN "portal"
etcdctl put $PREFIX_ETCD_PORTAL/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/header/$DOMAIN/Host "www.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# portal enabled ssl
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN 'true'
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
# etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD_PORTAL/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD_PORTAL/ipallow/$DOMAIN/1 "172.16.238.10"

# mobile
export DOMAIN=m.block.com
etcdctl put $PREFIX_ETCD_MOBILE/type/$DOMAIN "mobile"
etcdctl put $PREFIX_ETCD_MOBILE/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/header/$DOMAIN/Host "m.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# mobile enabled ssl
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN 'true'
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
# etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD_MOBILE/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD_MOBILE/ipallow/$DOMAIN/1 "172.16.238.10"