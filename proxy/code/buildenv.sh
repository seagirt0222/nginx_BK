#!/bin/sh

SetValToToml() {
    # generate confd toml
    #
    # example
    # SetValToToml app  mobile.nginx.conf.tmpl
    #
    # toml content
    #
    # [template]
    # prefix = "{prefix}"
    # src = "{src}"
    # dest = "{dest}"
    # owner = "root"
    # mode = "0666"
    # keys = [
    #     "/",
    # ]

    # check_cmd = "nginx -t -c /etc/nginx/nginx.conf"
    # reload_cmd = "nginx -s reload"

    templatesPath=$CONFD_PATH/$1.nginx.conf.toml
    cp /code/nginx.conf.toml $templatesPath

    # replace {prefix} => /a01/nginx/client
    sed -i "s/{prefix}/\/$NGINX_GROUP\/nginx\/$1/g" $templatesPath

    # replace {src} => client.nginx.conf.tmpl
    sed -i "s/{src}/$2/g" $templatesPath

    # replace {dest} => /etc/nginx/conf.d/a01.client.conf
    sed -i "s/{dest}/\/etc\/nginx\/conf.d\/$NGINX_GROUP.$1.conf/g" $templatesPath
}

# verify environment variables are set
if [[ -z "$ETCDCTL_ENDPOINTS" ]]; then
    echo ETCDCTL_ENDPOINTS variable missing
    exit 1
fi

CONFD_INTERVAL=${CONFD_INTERVAL:-10}
CONFD_PATH=/etc/confd/conf.d
NGINX_GROUP=${NGINX_GROUP:-"a01"}
NGINX_ADMIN=${NGINX_ADMIN:-"false"}
NGINX_AGENT=${NGINX_AGENT:-"false"}
NGINX_APICENTER=${NGINX_APICENTER:-"false"}
NGINX_API=${NGINX_API:-"false"}
NGINX_CDN=${NGINX_CDN:-"false"}
NGINX_CLIENT=${NGINX_CLIENT:-"false"}
NGINX_GAMEJUMP=${NGINX_GAMEJUMP:-"false"}
NGINX_MASTER=${NGINX_MASTER:-"false"}
NGINX_MOBILE=${NGINX_MOBILE:-"false"}
NGINX_PORTAL=${NGINX_PORTAL:-"false"}
NGINX_REDIRECT=${NGINX_REDIRECT:-"false"}
NGINX_ROBOTCENTER=${NGINX_ROBOTCENTER:-"false"}
NGINX_ROBOT=${NGINX_ROBOT:-"false"}
NGINX_THIRDPARTYJUMP=${NGINX_THIRDPARTYJUMP:-"false"}
NGINX_SYS=${NGINX_SYS:-"false"}
NGINX_PROXY_PROTOCOL=${NGINX_PROXY_PROTOCOL:-"false"}
NGINX_RESELLER=${NGINX_RESELLER:-"false"}
NGINX_APP=${NGINX_APP:-"false"}
BackendV2=backendV2.nginx.conf.tmpl
ETCD_User=${ETCD_User:-"false"}
ETCD_Password=${ETCD_Password:-"false"}

if [ $NGINX_PROXY_PROTOCOL == "true" ]; then
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/portal.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/backend.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/cdn.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/customer.backend.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/mobile.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/redirect.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/backendV2.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/client.nginx.conf.tmpl
    sed -i 's/\(listen.*\);/\1 proxy_protocol;/g' /etc/confd/templates/customerV2.backend.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/portal.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/backend.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/cdn.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/customer.backend.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/mobile.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/redirect.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/backendV2.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/client.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/confd/templates/customerV2.backend.nginx.conf.tmpl
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/nginx/nginx.conf
    sed -i 's/\<remote_addr\>/proxy_protocol_addr/g' /etc/nginx/log.conf
fi
if [ $NGINX_CLIENT == "true" ]; then
    #SetValToToml client  client.nginx.conf.tmpl
    SetValToToml client $BackendV2
fi
if [ $NGINX_MOBILE == "true" ]; then
    SetValToToml mobile mobile.nginx.conf.tmpl
fi
if [ $NGINX_PORTAL == "true" ]; then
    SetValToToml portal portal.nginx.conf.tmpl
    SetValToToml portalapi portal.nginx.conf.tmpl
fi
if [ $NGINX_REDIRECT == "true" ]; then
    SetValToToml redirect redirect.nginx.conf.tmpl
fi
if [ $NGINX_ADMIN == "true" ]; then
    SetValToToml admin $BackendV2
fi
if [ $NGINX_AGENT == "true" ]; then
    SetValToToml agent $BackendV2
fi
if [ $NGINX_APICENTER == "true" ]; then
    SetValToToml apicenter $BackendV2
fi
if [ $NGINX_API == "true" ]; then
    SetValToToml api $BackendV2
fi
if [ $NGINX_CDN == "true" ]; then
    SetValToToml cdn $BackendV2
fi
if [ $NGINX_GAMEJUMP == "true" ]; then
    SetValToToml gamejump $BackendV2
fi
if [ $NGINX_MASTER == "true" ]; then
    SetValToToml master $BackendV2
fi
if [ $NGINX_ROBOTCENTER == "true" ]; then
    SetValToToml robotcenter $BackendV2
fi
if [ $NGINX_ROBOT == "true" ]; then
    SetValToToml robot $BackendV2
fi
if [ $NGINX_THIRDPARTYJUMP == "true" ]; then
    SetValToToml thirdpartyjump $BackendV2
fi
if [ $NGINX_SYS == "true" ]; then
    SetValToToml sys $BackendV2
fi
if [ $NGINX_RESELLER == "true" ]; then
    SetValToToml reseller resellerapi.nginx.conf.tmpl
fi
if [ $NGINX_APP == "true" ]; then
    cp /etc/confd/templates/mobile.nginx.conf.tmpl /etc/confd/templates/app.nginx.conf.tmpl
    if [[ ! -z "$NGINX_APP_HTTPS_PORT" ]]; then
        sed -i "s/https\:\/\/\$http_host\$request_uri/https\:\/\/\$server_name\:${NGINX_APP_HTTPS_PORT}\$request_uri/g" /etc/confd/templates/app.nginx.conf.tmpl
    fi
    SetValToToml app app.nginx.conf.tmpl
fi
