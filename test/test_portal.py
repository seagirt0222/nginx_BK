import unittest
import requests
import json
import subprocess
import os

host = 'http://172.24.10.88/'
hosts = 'https://172.24.10.88/'
res=True
path = os.path.split(os.path.realpath(__file__))[0]
commit='sh '+path+'/Data/EtcdAdd_for_test.sh >/dev/null'
subprocess.call(commit,shell=True)

class TestStringMethods(unittest.TestCase):
    
    def test_return_status(self):
        # 自訂表頭
        my_headers = {'Host': 'www.TestStatus.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(host, headers=my_headers)

        self.assertEqual(r.status_code,200)

    def test_SSL(self):
        # 自訂表頭
        my_headers = {'Host': 'www.TestSSL.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(hosts, headers=my_headers,verify=False,allow_redirects=False)

        self.assertEqual(r.status_code,200)

    def test_Maintain(self):
        # 自訂表頭
        global res
        my_headers = {'Host': 'www.TestMaintain.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(host, headers=my_headers,allow_redirects=False)

        if r.status_code!=302 :
            res=False
        if r.headers['Location'] != "http://maintain.0a0w.com/Web.Portal/AN001-01.Portal/":
            res=False
        self.assertTrue(res)

    def test_SubFilter(self):
        # 自訂表頭
        my_headers = {'Host': 'www.TestSubFilter.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(host, headers=my_headers)
 
        self.assertEqual(r.text,'//cdn1.gjsoft.co')    
if __name__ == '__main__':
    unittest.main()
