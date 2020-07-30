#!/bin/sh

echo "######################################## test_backendV2 ########################################"
python3 /home/vagrant/nginx/test/test_backendV2.py 
echo ""
echo "######################################## test_client ########################################"
python3 /home/vagrant/nginx/test/test_client.py 
echo ""
echo "######################################## test_mobile ########################################"
python3 /home/vagrant/nginx/test/test_mobile.py 
echo ""
echo "######################################## test_portal ########################################"
python3 /home/vagrant/nginx/test/test_portal.py 
echo ""
echo "######################################## test_redirect ########################################"
python3 /home/vagrant/nginx/test/test_redirect.py 

