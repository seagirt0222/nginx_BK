export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://127.0.0.1:2379
export PREFIX_ETCD_PORTAL=/a01/nginx/portal
export PREFIX_ETCD_MOBILE=/a01/nginx/mobile

echo "########################## delete Key ##########################"
etcdctl del "" --prefix

etcdctl put $PREFIX_ETCD_PORTAL/block/url "http://127.0.0.1/block"

# portal
export DOMAIN=www.test123.com

etcdctl put $PREFIX_ETCD_PORTAL/type/$DOMAIN "portal"
etcdctl put $PREFIX_ETCD_PORTAL/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_PORTAL/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/header/$DOMAIN/Host "www.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/upstream/$DOMAIN/1 "portal1.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/upstream/$DOMAIN/2 "portal2.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/upstream/$DOMAIN/3 "portal3.test.local"
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_PORTAL/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# portal enabled ssl
etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
etcdctl put $PREFIX_ETCD_PORTAL/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD_PORTAL/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD_PORTAL/ipallow/$DOMAIN/1 "1.1.1.1"
etcdctl put $PREFIX_ETCD_PORTAL/ipallow/$DOMAIN/2 "2.2.2.2"

# mobile
export DOMAIN=m.test123.com
etcdctl put $PREFIX_ETCD_MOBILE/type/$DOMAIN "mobile"
etcdctl put $PREFIX_ETCD_MOBILE/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_MOBILE/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/header/$DOMAIN/Host "m.AA001-01.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/upstream/$DOMAIN/1 "portal1.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/upstream/$DOMAIN/2 "portal2.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/upstream/$DOMAIN/3 "portal3.test.local"
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_MOBILE/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# mobile enabled ssl
etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
etcdctl put $PREFIX_ETCD_MOBILE/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD_MOBILE/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD_MOBILE/ipallow/$DOMAIN/1 "1.1.1.1"
etcdctl put $PREFIX_ETCD_MOBILE/ipallow/$DOMAIN/2 "2.2.2.2"

##########################################################################################################
export PREFIX_ETCD=/a01/nginx/master
# master
export DOMAIN=master.test123.com
etcdctl put "$PREFIX_ETCD/type/$DOMAIN" "master"
etcdctl put "$PREFIX_ETCD/domain/$DOMAIN" "master.test123.com"
etcdctl put "$PREFIX_ETCD/domain/$DOMAIN/local" "master.AA001.test.local"
etcdctl put "$PREFIX_ETCD/header/$DOMAIN/Host" "master.AA001.test.local"
etcdctl put "$PREFIX_ETCD/upstream/$DOMAIN/1" "master1.test.local"
etcdctl put "$PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect" 'cdn1.cdn123.com'
etcdctl put "$PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect" 'cdn2.cdn123.com'
# block ip
etcdctl put $PREFIX_ETCD/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/17 "1.1.1.1"

##########################################################################################################
export PREFIX_ETCD_CDN=/a01/nginx/cdn
# cdn
export DOMAIN=cdn1.test123.com
etcdctl put $PREFIX_ETCD_CDN/type/$DOMAIN "cdn"
etcdctl put $PREFIX_ETCD_CDN/domain/$DOMAIN "cdn1.test123.com"
etcdctl put $PREFIX_ETCD_CDN/header/$DOMAIN/Host "cdn1.test.local"
etcdctl put $PREFIX_ETCD_CDN/domain/$DOMAIN/local "cdn1.test.local"
etcdctl put $PREFIX_ETCD_CDN/upstream/$DOMAIN/1 "cdn1.test.local"
etcdctl put $PREFIX_ETCD_CDN/subfilter/$DOMAIN/CdnRedirect 'cdn1.test123.com'
etcdctl put $PREFIX_ETCD_CDN/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.test123.com'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'

##########################################################################################################
export PREFIX_ETCD=/a01/nginx/redirect
# redirect
export DOMAIN=test123.com
etcdctl put "$PREFIX_ETCD/type/$DOMAIN" "redirect"
etcdctl put "$PREFIX_ETCD/domain/$DOMAIN" "test123.com"
etcdctl put "$PREFIX_ETCD/redirect/$DOMAIN/code" "301"
etcdctl put "$PREFIX_ETCD/redirect/$DOMAIN/to" '$scheme://www.test123.com$request_uri'

##########################################################################################################
export PREFIX_ETCD_CDN=/a01/nginx/reseller
# reseller
export DOMAIN=reseller.test123.com
echo "etcd $DOMAIN"
etcdctl put $PREFIX_ETCD_CDN/type/$DOMAIN "cdn"
etcdctl put $PREFIX_ETCD_CDN/domain/$DOMAIN "reseller.test123.com"
etcdctl put $PREFIX_ETCD_CDN/header/$DOMAIN/Host "reseller.test.local"
etcdctl put $PREFIX_ETCD_CDN/domain/$DOMAIN/local "reseller.test.local"
etcdctl put $PREFIX_ETCD_CDN/upstream/$DOMAIN/1 "reseller.test.local"
etcdctl put $PREFIX_ETCD_CDN/subfilter/$DOMAIN/CdnRedirect 'cdn1.test123.com'
etcdctl put $PREFIX_ETCD_CDN/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.test123.com'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
etcdctl put $PREFIX_ETCD_CDN/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'

##########################################################################################################
export PREFIX_ETCD=/a01/nginx/app

# APP
export DOMAIN=app.test123.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "app"
etcdctl put $PREFIX_ETCD/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "m.AA001-01.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "portal1.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/2 "portal2.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/3 "portal3.test.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# mobile enabled ssl
# etcdctl put $PREFIX_ETCD/ssl/$DOMAIN 'true'
# etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
# etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/1 "1.1.1.1"
etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/2 "2.2.2.2"

export PREFIX_ETCD=/a01/nginx/app

# APP + SSL
export DOMAIN=appssl.test123.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "app"
etcdctl put $PREFIX_ETCD/systemCode/$DOMAIN "AA001-01"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "AA001-01.test.local"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "m.AA001-01.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "portal1.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/2 "portal2.test.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/3 "portal3.test.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
# mobile enabled ssl
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN 'true'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert '/data/certs/test123.com/fullchain.pem'
etcdctl put $PREFIX_ETCD/ssl/$DOMAIN/cert_key '/data/certs/test123.com/privkey.pem'
# block ip
etcdctl put $PREFIX_ETCD/ipdeny/$DOMAIN/1 "all"
# allow ip
etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/1 "1.1.1.1"
etcdctl put $PREFIX_ETCD/ipallow/$DOMAIN/2 "2.2.2.2"

# portal
export DOMAIN=portalapi.domain.com
export PREFIX_ETCD_PORTALAPI=/a01/nginx/portalapi
etcdctl put $PREFIX_ETCD_PORTALAPI/type/$DOMAIN "portalapi"
etcdctl put $PREFIX_ETCD_PORTALAPI/systemCode/$DOMAIN "AP001-01"
etcdctl put $PREFIX_ETCD_PORTALAPI/domain/$DOMAIN "$DOMAIN"
etcdctl put $PREFIX_ETCD_PORTALAPI/domain/$DOMAIN/local "AP001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTALAPI/header/$DOMAIN/Host "www.AP001-01.test.local"
etcdctl put $PREFIX_ETCD_PORTALAPI/upstream/$DOMAIN/1 "portal1.test.local"
etcdctl put $PREFIX_ETCD_PORTALAPI/upstream/$DOMAIN/2 "portal2.test.local"
etcdctl put $PREFIX_ETCD_PORTALAPI/upstream/$DOMAIN/3 "portal3.test.local"
etcdctl put $PREFIX_ETCD_PORTALAPI/subfilter/$DOMAIN/CdnRedirect 'cdn1.cdn123.com'
etcdctl put $PREFIX_ETCD_PORTALAPI/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.cdn123.com'
