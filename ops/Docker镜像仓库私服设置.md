## Docker镜像仓库私服配置

### 局域网内配置
> 只需在本机配置域名 `cdnline.cn` 指向 `registry` 私服 `192.168.3.45:5000`
```
cat /etc/hosts     #外网设置 (同时增加nginx转发)
# 127.0.0.1      cdnline.cn   #本机设置
192.168.3.45     cdnline.cn   # 局域网内机器设置
```

### 外网服务器配置
```
### ping kuncts02.jzymcs.cn  # => 114.132.201.202
# cat /etc/hosts
192.168.3.45       cdnline.cn  # 局域网内本机设置
114.132.201.202    registry.cdnline.cn  # 为转发域名标识,需与 `frpc.ini` 配置一致

cat /etc/nginx/conf.d/registry.conf
server{
      listen    5000;
      server_name cdnline.cn;
      location / {
          proxy_pass http://registry.cdnline.cn:81;
      }
}

cat /etc/docker/daemon.json
{
  "insecure-registries" : ["cdnline.cn:5000","registry.cdnline.cn:81"]
}

docker pull hello-world
docker tag hello-world cdnline.cn:5000/hello-world
docker push cdnline.cn:5000/hello-world
```

### config snap docker
```
sudo snap stop docker
cat /var/snap/docker/current/config/daemon.json
{
    "log-level": "error",
    "storage-driver": "overlay2",
    "insecure-registries": ["cdnline.cn:5000","registry.cdnline.cn:81"]
}
sudo snap start docker
```
