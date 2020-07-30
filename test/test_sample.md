# test nginx script

# test portal allow
```
# execute at etcd container
wget http://172.16.238.21/ --header "Host: www.block.com"
wget http://172.16.238.21/ --header "Host: m.block.com"
```

# test block asp
```
curl http://127.0.0.1/index.asp -H "host: www.test123.com"
```