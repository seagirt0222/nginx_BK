#!/bin/sh
export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://127.0.0.1:2379
echo "########################## elete Key ##########################"
etcdctl del "" --prefix 
echo "########################## Add Key ##########################"
echo ""
etcdctl put '/a01/nginx/portal/Country/www.TestCountry.com/1' 'TW' 
etcdctl put '/a01/nginx/portal/Country/www.TestCountry.com/2' 'US' 
etcdctl put '/a01/nginx/portal/Country/www.TestCountry.com/3' 'CA' 
etcdctl put '/a01/nginx/portal/domain/www.TestCountry.com' 'www.TestCountry.com' 
etcdctl put '/a01/nginx/portal/domain/www.TestCountry.com/local' 'www.ac001.gjsoft.local' 
etcdctl put '/a01/nginx/portal/header/www.TestCountry.com/Host' 'keepalived.gjsoft.local' 
etcdctl put '/a01/nginx/portal/ipwhitelist/www.TestCountry.com/1' '59.125.119.36' 
etcdctl put '/a01/nginx/portal/ipwhitelist/www.TestCountry.com/2' '127.0.0.1' 
etcdctl put '/a01/nginx/portal/subfilter/www.TestCountry.com/Cdn2Redirect' 'cdn2.gjsoft.co' 
etcdctl put '/a01/nginx/portal/subfilter/www.TestCountry.com/CdnRedirect' 'cdn1.gjsoft.co' 
etcdctl put '/a01/nginx/portal/type/www.TestCountry.com' 'portal' 
etcdctl put '/a01/nginx/portal/upstream/www.TestCountry.com/1' 'localhost' 
echo ""

ABSPATH=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$ABSPATH"|sed 's/\/test//g')
cd $SCRIPTPATH
sudo sh ./build.sh
sudo sh ./run.sh
#docker exec nginx_proxy_1 sh -c "confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS && nginx -s reload"

domainname=www.TestCountry.com
url=http://127.0.0.1/Register/Submit

echo "####################### Register POST #######################"
for i in $(seq 1 20)
do
    echo $(date)
    curl -X "POST" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
sleep 0.5s
done
echo "####################### Register GET #######################"
for i in $(seq 1 10)
do
    echo $(date)
    curl -X "GET" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
sleep 0.5s
done

url=http://127.0.0.1/Account/Login 
echo "####################### Login POST #######################"
for i in $(seq 1 20)
do
    echo $(date)
    curl -X "POST" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
sleep 0.5s
done
echo "####################### Login GET #######################"
for i in $(seq 1 10)
do
    echo $(date)
    curl -X "GET" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
sleep 0.5s
done

url=http://127.0.0.1/Home/GetCaptchaForLogin
#echo "####################### GetCaptchaForLogin POST #######################"
#for i in $(seq 1 20)
#do
   # echo $(date)
   # curl -X "POST" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
#sleep 0.1s
#done
#echo "####################### GetCaptchaForLogin GET #######################"
#for i in $(seq 1 10)
#do
    #echo $(date)
    #curl -X "GET" -H "Host:$domainname" $url -Is |grep 'HTTP/1.1 200 OK' && echo " 第$i次"
#sleep 0.1s
#done
