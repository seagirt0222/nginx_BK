# Nginx 設定

目錄

- doc 環境設定 command
  - prod
  - prod-check
  - uat
  - sample.md 操作說明

## Uat

### Uat Debug 環境檢測

    # setup env
    rm -y .env-debug
    cat env/uat.env > .env-debug

    # start container with build
    sudo ./check.sh

    # enter container and sync config and reload
    docker exec -it nginx_proxy-check_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

### Uat 上正式

    # setup env
    rm .env
    cat env/uat.env > .env

    # build current image (optional)
    sudo ./build.sh

    # start latest version container
    sudo ./run.sh

    docker exec -it nginx_proxy_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

## prod

### Production debug 環境檢測

    # setup env
    rm .env-debug
    #cat env/prod159.env > .env-debug
    #cat env/prod160.env > .env-debug
    #cat env/prod162.env > .env-debug
    cat env/prod_ip108.env > .env-debug

    # start container with build
    sudo ./check.sh

    # enter container and sync config and reload
    docker exec -it nginx_proxy-check_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

### Prod 上正式 159

    rm .env
    cat env/prod159.env > .env

    # build current image (optional)
    sudo ./build.sh

    # start latest version container
    sudo ./run.sh

    docker exec -it nginx_proxy_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

### Prod 上正式 160

    rm .env
    cat env/prod160.env > .env

    # build current image (optional)
    sudo ./build.sh

    # start latest version container
    sudo ./run.sh

    docker exec -it nginx_proxy_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

### Prod 上正式 162

    rm .env
    cat env/prod162.env > .env

    # build current image (optional)
    sudo ./build.sh

    # start latest version container
    sudo ./run.sh

    docker exec -it nginx_proxy_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

### Prod 上正式 108(internal)

    rm .env
    cat env/prod_ip108.env > .env

    # build current image (optional)
    sudo ./build.sh

    # start latest version container
    sudo ./run.sh

    docker exec -it nginx_proxy_1 /bin/sh
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug
    nginx -t && nginx -s reload

## 修改 confd prefix

    sed -i 's/\/a01\/nginx\/robotcenter/\a01\/nginx-chk\/robotcenter/g' /etc/confd/conf.d/robotcenter.nginx.conf.toml
    confd -onetime -backend etcdv3 -node $ETCDCTL_ENDPOINTS -sync-only -log-level debug

## 複製 container/file 執行比對

    docker cp nginx_proxy-check:/etc/nginx/conf.d/a01.portal.conf ./ssl.portal.conf
    docker cp nginx_proxy_1:/etc/nginx/conf.d/a01.portal.conf ./no.portal.conf
    diff ssl.portal.conf no.portal.conf

## 通知 HK 新增 master domain

    新增 DNS CNAME 指向 謝謝
    dte2n.0a0w.com => master.0a0w.com

## test nginx domain binding

測試 nginx domain 是否已經有生效，在外部 DNS 未生效前，可以用這各檢測 nginx。

    curl -H "host: dte2n.0a0w.com" http://localhost

## export all etcd config

    export ETCDCTL_API=3
    export ETCDCTL_ENDPOINTS=http://10.85.4.130:2379
    etcdctl get / --prefix|sed 's/.*/"&"/g' | sed ':a;N;$!ba;s/\n/ /g'  | sed 's/"\//\n"\//g' | sed 's/.*/etcdctl put &/g' |sed '1d' > import.sh

## export all nginx etcd config

    export ETCDCTL_API=3
    export ETCDCTL_ENDPOINTS=http://10.85.4.130:2379
    etcdctl get /a01/nginx --prefix|sed 's/.*/"&"/g' | sed ':a;N;$!ba;s/\n/ /g'  | sed 's/"\/a01/\n"\/a01/g' | sed 's/.*/etcdctl put &/g' |sed '1d' > import.sh

## export portal nginx etcd config

    export ETCDCTL_API=3
    export ETCDCTL_ENDPOINTS=http://10.85.4.130:2379
    etcdctl get /a01/nginx/portal --prefix|sed 's/.*/"&"/g' | sed ':a;N;$!ba;s/\n/ /g'  | sed 's/"\/a01/\n"\/a01/g' | sed 's/.*/etcdctl put &/g' |sed '1d' > import.sh

## export mobile nginx etcd config

    export ETCDCTL_API=3
    export ETCDCTL_ENDPOINTS=http://10.85.4.130:2379
    etcdctl get /a01/nginx/mobile --prefix|sed 's/.*/"&"/g' | sed ':a;N;$!ba;s/\n/ /g'  | sed 's/"\/a01/\n"\/a01/g' | sed 's/.*/etcdctl put &/g' |sed '1d' > import.sh
