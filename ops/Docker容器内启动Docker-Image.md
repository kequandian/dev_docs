### 绑定主机容器
```shell
docker run -v /var/run/docker.sock:/var/run/docker.sock -ti docker
```

### 通过 nginx 发起`api`请求
https://docs.docker.com/engine/api/v1.41/
```
curl --unix-socket /var/run/docker.sock http://localhost/volumes
```
