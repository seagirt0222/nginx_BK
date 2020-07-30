shellname=$(grep -wa "container_name:" $1 | sed 's/^.*container_name: //g')
docker stop $shellname > /dev/null
docker rm $shellname > /dev/null
