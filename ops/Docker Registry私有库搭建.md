# Docker Registry——私有库搭建

## 1. 搭建

Docker官方有提供一个私有仓库的镜像为“**Registry**”，只需要将镜像下载下来，并运行在**5000端口**即可使用。具体指令如下所示：

```shell
docker run -d -v /opt/registry:/var/lib/registry -p 5000:5000 --name docker_registry registry:2
```

上述指令表示，将registry镜像以后台方式运行在5000端口并将容器内部路径的/var/lib/registry挂载至/opt/registry外部路径下。

随后使用Curl命令进行测试，测试结果如下说明私有库已成功搭建。

```shell
[dockers@dockerhub ~]$ curl http://localhost:5000/v2
<a href="/v2/">Moved Permanently</a>
```



## 2. 验证

首先查看本地镜像：

```shell
[dockers@dockerhub ~]$ docker images
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
tomcat               latest              b4f6a90c69a4        4 days ago          647MB
registry               2                 2d4f4b5309b1        5 weeks ago         26.2MB
openjdk             11.0.7-jdk           fcfdce4526df        6 weeks ago         627MB
```

随后将要推送的image的tag标志更改为要推送到的私有仓库，如下所示：

```shell
docker tag imagename:tag localhost:5000/name:tag
```

随后使用push命令提交至私有库尝试是否有效：

```shell
[dockers@dockerhub ~]$ docker pull localhost:5000/imagename:tag
Error response from daemon: Get https://localhost:5000/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
```

出现上述情况，则说明**本机未创建Docker网络注册**，可通过以下方法，**添加私库IP至注册文件中**。

```shell
[dockers@dockerhub ~]$ sudo vim /etc/docker/daemon.json
{
   "insecure-registries": [
       "hostname:5000",
       "192.168.3.xxx:5000"
   ]
}
## :wq保存后退出
```

保存退出后重启Docker服务即可。

```shell
[dockers@dockerhub ~]$ systemctl restart docker
```

再次进行镜像推送，无发现问题，如下所示：

```shell
[root@localhost ~]# docker push 192.168.3.xxx:5000/testimage:latest
The push refers to repository [192.168.3.xxx:5000/testimage]
f8fbfaa06b1b: Pushed 
a60df0ef55d1: Pushed 
e24ab2f9d4ce: Pushed 
86e27592aea5: Pushed 
b55caf850422: Pushed 
8bb833089809: Pushed 
b7de30e01af4: Pushed 
0eb2d6a30cd5: Pushed 
039fe0fe3981: Pushed 
82adbf0fa8d4: Pushed 
df64d3292fd6: Pushed 
latest: digest: sha256:95620571bbadef953aef8d378ea254b177745d1bf954d635b0349926c53f4f21 size: 2614
```

至此，Docker私有库搭建完成。

