import unittest
import requests
import json
import subprocess
import os
host = 'http://172.24.10.88/'
hosts = 'https://172.24.10.88/'
path = os.path.split(os.path.realpath(__file__))[0]
commit='sh '+path+'/Data/EtcdAdd_for_test.sh >/dev/null'
print(commit)
subprocess.call(commit,shell=True)

class TestStringMethods(unittest.TestCase):

    def test_SSL(self):
        # 自訂表頭
        my_headers = {'Host': 'www.RedirectSSL.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(hosts, headers=my_headers,allow_redirects=False,verify=False)

        # print(r.headers["Location"])
        self.assertEqual(self.assertEqual(r.status_code, 301),self.assertEqual(r.headers["Location"], 'https://www.RedirectSSL.com/'))

    def test_return_status(self):
        # 自訂表頭
        my_headers = {'Host': 'www.RedirectStatus.com'}

        # 使用 GET 方式下載普通網頁 allow_redirects：URL導向
        r = requests.get(host, headers=my_headers,allow_redirects=False)

        # print(r.headers["Location"])
        self.assertEqual(self.assertEqual(r.status_code, 301),self.assertEqual(r.headers["Location"], 'http://www.RedirectStatus.com/'))
        
if __name__ == '__main__':
    unittest.main()
