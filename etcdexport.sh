#!/bin/sh
export ETCDCTL_API=3
etcdctl get /a01 --prefix|sed "s/.*/'&'/g" | sed ':a;N;$!ba;s/\n/ /g'  | sed "s/'\/a01/\n'\/a01/g" | sed 's/.*/etcdctl put &/g' |sed '1d' > import.sh
