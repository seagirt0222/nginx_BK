#!/bin/sh
echo "test $1"
curl -I -H "HOST: $1" http://localhost

echo "test www.$1"
curl -I -H "HOST: www.$1" http://localhost
