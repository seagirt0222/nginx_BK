#!/bin/bash
filename=urllist.sh
path=/home/vagrant/nginx/scripts/${filename}

count=$(grep -c 'http' ${path})
json='{"Response":['
for (( i=1; i < count+1; i++ ))
	do 
	url=$(grep 'http' urllist.sh | head -n ${i} |tail -n +${i})
	if [[ $url =~ (https)://(m.) ]]; then
		$(curl -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Mobile Safari/537.36' ${url} -Is > url.tmp)
	else
		$(curl ${url} -Is  > url.tmp)
	fi
	head=$(grep 'HTTP' url.tmp |head -n 1)
	headdata=$(cat url.tmp | sed 's,\",\\",g' | sed 's,\r,,g')
	httpcode=$(echo ${head} | sed 's,[0-9][\.][0-9],,g' | sed 's,[^0-9],,g')
	httpmessage=$(echo $head |sed 's,HTTP/,,g'| sed 's,[0-9][\.][0-9],,g' | sed 's,[^a-zA-Z],,g')
         if [ -z $httpcode ]; then
                httpcode=null;
                httpmessage=null;
                headdata=null;
        fi 
	json=$json'{"url":"'$url'","code":"'$httpcode'","message":"'$httpmessage'","head":"'$headdata'"},'
	done
$(echo $json"]}" > Url_Respons_Data.txt)
$(rm url.tmp)
