export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://172.24.10.164:2379
export PREFIX_ETCD=/a01/nginx/portal
export MOBILE_ETCD=/a01/nginx/mobile

# portal - cdn
#etcdctl put /a01/nginx/portal/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put /a01/nginx/portal/cdn/Cdn2Redirect 'cdn2.gjsoft.co'
#mobile - cdn
#etcdctl put /a01/nginx/mobile/cdn/CdnRedirect 'cdn1.gjsoft.co'
#etcdctl put /a01/nginx/mobile/cdn/Cdn2Redirect 'cdn2.gjsoft.co'

# dxx.gjsoft.co
etcdctl put /a01/nginx/portal/type/www.dxx.gjsoft.co "portal"
etcdctl put /a01/nginx/portal/domain/www.dxx.gjsoft.co "~^(?<wwwhost>www)\.(?<hostno>d\d+)\.(?<area>gjsoft\.co|allnetgame\.co)"
etcdctl put /a01/nginx/portal/header/www.dxx.gjsoft.co/Host "www.\$hostno.gjsoft.local"
etcdctl put /a01/nginx/portal/domain/www.dxx.gjsoft.co/local "\$hostno.gjsoft.local"
etcdctl put /a01/nginx/portal/upstream/www.dxx.gjsoft.co/1 "web2.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/www.dxx.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/www.dxx.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'

etcdctl put /a01/nginx/mobile/type/m.dxx.gjsoft.co "mobile"
etcdctl put /a01/nginx/mobile/domain/m.dxx.gjsoft.co "~^(?<wwwhost>m)\.(?<hostno>d\d+)\.(?<area>gjsoft\.co|allnetgame\.cod)"
etcdctl put /a01/nginx/mobile/header/m.dxx.gjsoft.co/Host "m.\$hostno.gjsoft.local"
etcdctl put /a01/nginx/mobile/domain/m.dxx.gjsoft.co/local "\$hostno.gjsoft.local"
etcdctl put /a01/nginx/mobile/upstream/m.dxx.gjsoft.co/1 "web2.gjsoft.local"
etcdctl put $MOBILE_ETCD/subfilter/m.dxx.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'
etcdctl put $MOBILE_ETCD/subfilter/m.dxx.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'
# gjsoft.co
etcdctl put /a01/nginx/portal/type/www.gjsoft.co "portal"
etcdctl put /a01/nginx/portal/domain/www.gjsoft.co "~^(?<wwwhost>www|m)\.(?<area>gjsoft\.co|gjsoft\.cod)"
etcdctl put /a01/nginx/portal/header/www.gjsoft.co/Host "www.ac001.gjsoft.local"
etcdctl put /a01/nginx/portal/domain/www.gjsoft.co/local "ac001.gjsoft.local"
etcdctl put /a01/nginx/portal/upstream/www.gjsoft.co/1 "web1.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/www.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/www.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'

etcdctl put /a01/nginx/mobile/type/m.gjsoft.co "mobile"
etcdctl put /a01/nginx/mobile/domain/m.gjsoft.co "~^(?<wwwhost>m)\.(?<area>gjsoft\.co|gjsoft\.cod)"
etcdctl put /a01/nginx/mobile/header/m.gjsoft.co/Host "m.ac001.gjsoft.local"
etcdctl put /a01/nginx/mobile/domain/m.gjsoft.co/local "ac001.gjsoft.local"
etcdctl put /a01/nginx/mobile/upstream/m.gjsoft.co/1 "web1.gjsoft.local"
etcdctl put $MOBILE_ETCD/subfilter/m.gjsoft.co/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $MOBILE_ETCD/subfilter/m.gjsoft.co/CdnRedirect 'cdn1.gjsoft.co'
# dev.gj
etcdctl put /a01/nginx/portal/type/www.dev.gj "portal"
etcdctl put /a01/nginx/portal/domain/www.dev.gj "~^(?<wwwhost>www)\.(?<area>dev\.gj)"
etcdctl put /a01/nginx/portal/header/www.dev.gj/Host "www.ac001.gjsoft.local"
etcdctl put /a01/nginx/portal/domain/www.dev.gj/local "ac001.gjsoft.local"
etcdctl put /a01/nginx/portal/upstream/www.dev.gj/1 "web1.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/www.dev.gj/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/www.dev.gj/CdnRedirect 'cdn1.gjsoft.co'

# add agent id for test
#etcdctl put /a01/nginx/portal/agent/www.dev.gj/id "11"

etcdctl put /a01/nginx/mobile/type/m.dev.gj "mobile"
etcdctl put /a01/nginx/mobile/domain/m.dev.gj "~^(?<wwwhost>m)\.(?<area>dev\.gj)"
etcdctl put /a01/nginx/mobile/header/m.dev.gj/Host "m.ac001.gjsoft.local"
etcdctl put /a01/nginx/mobile/domain/m.dev.gj/local "ac001.gjsoft.local"
etcdctl put /a01/nginx/mobile/upstream/m.dev.gj/1 "web1.gjsoft.local"
etcdctl put $MOBILE_ETCD/subfilter/m.dev.gj/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $MOBILE_ETCD/subfilter/m.dev.gj/CdnRedirect 'cdn1.gjsoft.co'

# add agent id for test
# etcdctl put /a01/nginx/mobile/agent/m.dev.gj/id "11"

# pay123.allnetgame.com
etcdctl put $PREFIX_ETCD/type/pay123.allnetgame.com "portal"
etcdctl put $PREFIX_ETCD/domain/pay123.allnetgame.com "~^(?<wwwhost>pay123)\.(?<area>allnetgame\.com)"
etcdctl put $PREFIX_ETCD/header/pay123.allnetgame.com/Host "pay.gjsoft.local"
etcdctl put $PREFIX_ETCD/domain/pay123.allnetgame.com/local "pay.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/pay123.allnetgame.com/1 "pay.gjsoft.local"

# test portal ssl
etcdctl put /a01/nginx/portal/type/www.t01.gjsoft.co "portal"
etcdctl put /a01/nginx/portal/domain/www.t01.gjsoft.co "www.t01.gjsoft.co"
etcdctl put /a01/nginx/portal/domain/www.t01.gjsoft.co/local "d21.gjsoft.local"
etcdctl put /a01/nginx/portal/header/www.t01.gjsoft.co/Host "www.d21.gjsoft.local"
etcdctl put /a01/nginx/portal/upstream/www.t01.gjsoft.co/1 "web2.gjsoft.local"

## portal enabled ssl
etcdctl put /a01/nginx/portal/ssl/www.t01.gjsoft.co ''
etcdctl put /a01/nginx/portal/ssl/www.t01.gjsoft.co/cert '/etc/letsencrypt/live/www.t01.gjsoft.co/fullchain.pem'
etcdctl put /a01/nginx/portal/ssl/www.t01.gjsoft.co/cert_key '/etc/letsencrypt/live/www.t01.gjsoft.co/privkey.pem'

## portal enabled maintain
etcdctl put /a01/nginx/portal/maintain/www.t01.gjsoft.co ''
etcdctl put /a01/nginx/portal/maintain/www.t01.gjsoft.co/url 'http://maintain.0a0w.com/Web.Portal/AN002-01.Portal/index.html'

## portal enabled whitelist
#ip
etcdctl put /a01/nginx/portal/ipwhitelist/www.t01.gjsoft.co/1 "59.125.119.35" 
#country 2 char
etcdctl put /a01/nginx/portal/Country/www.t02.gjsoft.co/1 "TW"

# test mobile ssl
etcdctl put /a01/nginx/mobile/type/m.t01.gjsoft.co "mobile"
etcdctl put /a01/nginx/mobile/domain/m.t01.gjsoft.co "m.t01.gjsoft.co"
etcdctl put /a01/nginx/mobile/domain/m.t01.gjsoft.co/local "d21.gjsoft.local"
etcdctl put /a01/nginx/mobile/header/m.t01.gjsoft.co/Host "m.d21.gjsoft.local"
etcdctl put /a01/nginx/mobile/upstream/m.t01.gjsoft.co/1 "web2.gjsoft.local"

# mobile enabled ssl
etcdctl put /a01/nginx/mobile/ssl/m.t01.gjsoft.co ''
etcdctl put /a01/nginx/mobile/ssl/m.t01.gjsoft.co/cert '/etc/letsencrypt/live/www.t01.gjsoft.co/fullchain.pem'
etcdctl put /a01/nginx/mobile/ssl/m.t01.gjsoft.co/cert_key '/etc/letsencrypt/live/www.t01.gjsoft.co/privkey.pem'

## mobile enabled maintain
etcdctl put /a01/nginx/mobile/maintain/m.t01.gjsoft.co ''
etcdctl put /a01/nginx/mobile/maintain/m.t01.gjsoft.co/url 'http://maintain.0a0w.com/Web.Portal/AN002-01.Portal/index.html'

## mobile enabled whitelist
#ip
etcdctl put /a01/nginx/mobile/ipwhitelist/m.t01.gjsoft.co/1 "59.125.119.35" 
#country 2 char
etcdctl put /a01/nginx/mobile/Country/m.t02.gjsoft.co/1 "TW"

# etcdctl del /a01/nginx/portal --prefix 
# etcdctl del /a01/nginx/mobile --prefix 


export DOMAIN=www.kzhn.allnetgame.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "portal"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "www.kzhn.allnetgame.com"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "www.d04.gjsoft.local"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "d04.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "web2.gjsoft.local"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
export DOMAIN=m.kzhn.allnetgame.com
etcdctl put $MOBILE_ETCD/type/$DOMAIN "mobile"
etcdctl put $MOBILE_ETCD/domain/$DOMAIN "m.kzhn.allnetgame.com"
etcdctl put $MOBILE_ETCD/header/$DOMAIN/Host "m.d04.gjsoft.local"
etcdctl put $MOBILE_ETCD/domain/$DOMAIN/local "d04.gjsoft.local"
etcdctl put $MOBILE_ETCD/upstream/$DOMAIN/1 "web2.gjsoft.local"
etcdctl put $MOBILE_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $MOBILE_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'


export DOMAIN=www.amg88demo.com
etcdctl put $PREFIX_ETCD/type/$DOMAIN "portal"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN "www.amg88demo.com"
etcdctl put $PREFIX_ETCD/header/$DOMAIN/Host "ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/domain/$DOMAIN/local "ac002.gjsoft.local"
etcdctl put $PREFIX_ETCD/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $PREFIX_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'
export DOMAIN=m.amg88demo.com
etcdctl put $MOBILE_ETCD/type/$DOMAIN "mobile"
etcdctl put $MOBILE_ETCD/domain/$DOMAIN "m.amg88demo.com"
etcdctl put $MOBILE_ETCD/header/$DOMAIN/Host "m.ac002.gjsoft.local"
etcdctl put $MOBILE_ETCD/domain/$DOMAIN/local "ac002.gjsoft.local"
etcdctl put $MOBILE_ETCD/upstream/$DOMAIN/1 "127.0.0.1"
etcdctl put $MOBILE_ETCD/subfilter/$DOMAIN/Cdn2Redirect 'cdn2.gjsoft.co'
etcdctl put $MOBILE_ETCD/subfilter/$DOMAIN/CdnRedirect 'cdn1.gjsoft.co'

