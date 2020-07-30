#!/bin/sh
export ETCDCTL_API=3
if [ ! -n "$1" ];then
    echo "Url is null!"
    exit
fi

url=$1/Register/Submit

echo "####################### Register POST #######################"
for i in $(seq 1 20)
do
    echo $(date)
    curl -X "POST" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
sleep 0.5s
done
echo "####################### Register GET #######################"
for i in $(seq 1 10)
do
    echo $(date)
    curl -X "GET" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
sleep 0.5s
done

url=$1/Account/Login 
echo "####################### Login POST #######################"
for i in $(seq 1 20)
do
    echo $(date)
    curl -X "POST" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
sleep 0.5s
done
echo "####################### Login GET #######################"
for i in $(seq 1 10)
do
    echo $(date)
    curl -X "GET" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
sleep 0.5s
done

url=$1/Home/GetCaptchaForLogin
#echo "####################### GetCaptchaForLogin POST #######################"
#for i in $(seq 1 20)
#do
   # echo $(date)
   # curl -X "POST" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
#sleep 0.1s
#done
#echo "####################### GetCaptchaForLogin GET #######################"
#for i in $(seq 1 10)
#do
    #echo $(date)
    #curl -X "GET" $url -Is |grep 'HTTP/1.1 503' && echo " 第$i次"
#sleep 0.1s
#done
