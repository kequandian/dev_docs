[163 CentOS镜像](http://mirrors.163.com/.help/centos.html)
```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
## centos7
curl -O http://mirrors.163.com/.help/CentOS7-Base-163.repo
## centos6
curl -O  http://mirrors.163.com/.help/CentOS6-Base-163.repo
mv CentOS6-Base-163.repo /etc/yum.repos.d/CentOS-Base.repo
```

### 使用163的源遇到以下问题
```
# yum update
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
http://mirrors.163.com/centos/6/addons/x86_64/repodata/repomd.xml: [Errno 14] PYCURL ERROR 22 - "The requested URL returned error: 404 Not Found"
Trying other mirror.
Error: Cannot retrieve repository metadata (repomd.xml) for repository: addons. Please verify its path and try again
## solution
vi /etc/yum/pluginconf.d/fastestmirror.conf
# Change enabled=1 to enabled=0 to disable the fastestmorror plugin.
enable=0
```

## 使用阿里的源 (centos 6.5)
```
curl -o /etc/yum.repos.d/CentOS-Base.repo http://allen-hz-bucket.oss-cn-hangzhou.aliyuncs.com/centos/Centos-6-Vault-Aliyun.repo
## cause issue
https://nginx.org/packages/centos/6/x86_64/repodata/repomd.xml: [Errno 14] problem making ssl connection
Trying other mirror.
Error: Cannot retrieve repository metadata (repomd.xml) for repository: nginx. Please verify its path and try again
## solution
vi /etc/yum.repos.d/nginx.repo
enable=0  ## 禁用 ssl
```




