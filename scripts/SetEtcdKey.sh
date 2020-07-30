#!/bin/sh
export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=http://172.24.10.88:2379
#export ETCDCTL_ENDPOINTS=http://10.85.4.130:2379
PREFIX_ETCD_PORTAL="/a01/nginx/"
echo "------------HOST-------------"
domainKey="agent admin api apicenter gamejump client cdn robotcenter sys thirdpartyjump robot master"
for x in $domainKey; do
    echo "########################################## domainKey: $x ########################################## "
    Domainlocal=$(etcdctl get /a01/nginx/$x/ --prefix  --keys-only=true |grep '/domain/.*/local')
    for y in $Domainlocal; do
        Type=$(echo $y| sed 's,/a01/nginx/,,g'| sed 's,/.*,,g')
        Domain=$(echo $y| sed 's,/.*/domain/,,g'| sed 's,/local,,g')
        val=$(etcdctl get $y --print-value-only=true)
        echo "etcdctl put $PREFIX_ETCD_PORTAL$Type"/header/"$Domain"/Host" $val"
        etcdctl put $PREFIX_ETCD_PORTAL$Type"/header/"$Domain"/Host" $val
    done
    echo ""
done

echo ""
echo "--------------SSL-----------------"
Key=$(etcdctl get "" --prefix --keys-only=true|grep '/a01/nginx/.*/ssl/'|grep -v '/ssl/.*/')
for x in $Key; do
    Type=$(echo $x | sed 's,/ssl/.*,,g'|sed 's,/a01/nginx/,,g')
    Domain=$(echo $x | sed 's,.*/,,g')
    echo "etcdctl put $PREFIX_ETCD_PORTAL$Type"/ssl/"$Domain true"
    etcdctl put $PREFIX_ETCD_PORTAL$Type"/ssl/"$Domain true
    #etcdctl get $PREFIX_ETCD_PORTAL$Type"/ssl/"$Domain
done

echo ""
echo "--------------Maintain-----------------"
maintain=$(etcdctl get "" --prefix --keys-only=true|grep '/a01/nginx/.*/maintain/' |grep -v 'maintain/.*/url')
for x in $maintain; do
    maintaintype=$(echo $x | sed 's,/maintain/.*,,g'|sed 's,/a01/nginx/,,g')
    maintainDomain=$(echo $x | sed 's,.*/,,g')
    echo "etcdctl put $PREFIX_ETCD_PORTAL$maintaintype"/maintain/"$maintainDomain true"
    etcdctl put $PREFIX_ETCD_PORTAL$maintaintype"/maintain/"$maintainDomain true
    
done
