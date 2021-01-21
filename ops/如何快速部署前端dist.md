
## 一步部署方案

#### 准备 dist
登录具备docker容器环境的服务器，创建一个新目录，把构建好的dist放置至此目录下
```
$ ls
dist/
```

#### 运行
> 通过curl逐个文件下载
```
curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/docker/tag/web/docker-run.sh | bash -
```

#### 访问
> 端口默认设置为 `8000`
>
获取容器服务器的IP，如本机执行，在浏览器中输入地址 `http://127.0.0.1:8000`


#### 修改部署端口
在部署目录会下载默认的 docker-compose.yml,修改里面的端口，然后执行
```
docker-compose up
```
