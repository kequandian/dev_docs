# 基于Frp的内网穿透搭建

> **Frp工具各版本下载地址：https://github.com/fatedier/frp/releases**

## 1. 下载

通过上述下载地址寻找与系统相匹配的版本。

- **Linux版本的选择**

由于Linux系统的体系结构众多，下载Frp则**需根据自身系统的系统架构来选择对应的版本**。**（Tips：若版本选择错误，将无法启动Frp）**

通过`uname -a`命令确定系统的体系架构，如下所示。

**X86架构**

```shell
$ uname -a
Linux localhost.localdomain 3.10.0-957.el7.x86_64 #1 SMP Thu Nov 8 23:39:32 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

**ARM架构**

```shell
$ uname -a
Linux tegra-ubuntu 4.4.38-tegra #1 SMP PREEMPT Fri Jul 28 09:55:22 PDT 2020 aarch64 aarch64 aarch64 GNU/Linux
```

**MIPS架构**

```shell
$ uname -a
Linux DrogooBox 3.3.8 #33 Tue Mar 22 15:02:01 CST 2020 mips GNU/Linux
```

根据不同的系统架构及位数在下载地址中下载对应的版本文件。

## 2. 解压

使用`tar`命令解压Frp压缩包，具体步骤如下所示。

```shell
# 解压frp文件夹
$ tar -zxvf frp_0.33.0_linux_386.tar.gz 
```

进入目录中可以看到 frpc frpc_full.ini frpc.ini frps frps_full.ini frps.ini LICENSE 这七个文件

- **frpc:** 客户端可执行程序
- **frpc_full.ini:** 客户端所有配置项（可以在此文件查看frp的所有的配置项）
- **frpc.ini:** 客户端配置项
- **frps:** 服务端可执行程序
- **frps_full.ini:** 服务端所有配置项（可以在此文件查看frp的所有的配置项）
- **frps.ini:** 服务端配置项
- **LICENSE:** 许可证

##  3. 配置

由上述已知**frpc.ini**为客户端所需填写的配置文件，而**frps.ini**为服务端所需要填写的配置文件。

- **服务端**

```shell
# 编辑frps.ini配置文件
$ vim frps.ini
```

可以看到服务端默认配置如下所示。

```ini
[common]
# 默认绑定通信端口号
bind_port = 7000
```

默认的配置信息中只有一个绑定端口为7000，意思是我们在外网服务器中绑定7000端口和客户端进行通信。**（Tips：端口可以自定义，但是需要客户端和服务端进行统一。阿里云服务器或其他云服务器都需要在ECS管理中配置安全组规则中添加相应的7000端口）**

- **客户端**

同时查看并配置客户端。

```shell
# 编辑frpc.ini配置文件
$ vim frpc.ini
```

可以看到客户端默认配置如下所示。

```ini
[common]
server_addr = 120.67.78.78
server_port = 7000

[ssh]
type = tcp
local_ip = 192.168.3.3
local_port = 22
remote_port = 6000
```

- **[common]** 表示以下配置信息是一些公用配置信息；
- **server_addr** 是服务端即外网服务器的公网访问ip；
- **server_port** 是我们前面在服务端配置的**frps.ini**中**bind_port**中对应的端口，需保持两边一致，后续将依赖此端口进行通信；
- **[ssh]** 表示以下配置信息是我们使用ssh连接内网服务器时需要的一些配置信息；
- **type** 是连接类型，ssh方式连接就用tcp；
- **local_ip** 是本机ip,直接使用127.0.0.1即可；
- **local_port** 是本地ssh端口，ssh默认端口为22；
- **remote_port** 是外网服务器请求过来的端口。**（Tips：阿里云服务器或其他云服务器都需要在ECS管理中配置安全组规则中添加6000端口。）**

## 4. 运行

在完成上述步骤后，并确定端口正常使用的情况下，切换至Frp目录下，可以执行如下命令启动服务端与客户端的Frp。**（Tips：先启动服务端）**

- **服务端启动**

```shell
$ ./frps -c ./frps.ini
```

- **客户端启动**

```shell
$ ./frpc -c ./frpc.ini
```

至此，Frp内网穿透已成功搭建。

## 5. 测试

通过连接内网的SSH从而测试穿透内网访问客户端已成功实现，如下所示。

```shell
# 在别的服务器上连接内网SSH
$ ssh root@xxx.xxxx.cn -p 6000
root@xxx.xxxx.cn's password: 
# 登录内网服务器成功
Last login: Fri Jul 99 xx:xx:xx 2222 from 192.168.3.179
```

## 6. 使用场景

>**例子：** 本地服务器部署Docker Registry作为Docker Hub使用，但外网无法访问且无法拉取本地私服Docker Hub内镜像。
>
>**方案：** 使用Frp进行内网穿透，使用一台云服务器作为跳板，通过访问云服务器从而由其进行内网穿透获取数据并返回至请求端。

### 6.1 环境详情

>**Tips：本文所述IP、名称和角色均为虚构化。**

|        **IP**         |   **名称**   |  **角色**  |
| :-------------------: | :----------: | :--------: |
| 192.168.1.1（外网IP） | Cloud Server |  云服务器  |
| 192.168.2.1（内网IP） |  Docker Hub  | 本地客户端 |
|         未知          |    Vistor    | 资源请求者 |

>**Docker Hub已搭建完成，Docker服务已正常开启，且在本地可以正常进行Pull与Push操作。**
>
>**Cloud Server为正常可通过其外网IP进行访问的云服务器，同时所需端口已开放。**

### 6.2 客户端配置（Docker Hub）

在**Docker Hub本地客户端**中，将路径切换至Frp目录下，随后编辑其配置文件，如下所示。

```shell
$ vim frpc.ini
```

新增如下配置内容，如下所示。

```ini
[common]
# 服务器外网IP
server_addr = 120.67.78.78
# 服务端与客户端通信端口
server_port = 5001

[docker-hub]
# 请求方式
type = http
# 本地IP 192.168.2.1 / 127.0.0.1 均可
local_ip = 192.168.2.1
# 本地Docker Registry对应端口
local_port = 5000
# 云服务器转发请求端口
remote_port = 5000
# 自定义域名（即对应的云端域名）
custom_domains = custom.domain.cn
```

>**Tips：启动过程中如出现`Parse conf error: proxy [web01] custom_domains and subdomain should set at least one of them`报错，则表示未填入`custom_domains`字段信息，补充后重试即可。**

### 6.3 服务端配置（Cloud Server）

在**Cloud Server云服务端**中，将路径切换至Frp目录下，随后编辑其配置文件，如下所示。

```shell
$ vim frps.ini
```

修改为如下配置内容，如下所示：

```ini
[common]
# 服务端与客户端通信端口（对应客户端的server_port字段）
bind_port = 5001
# 请求转发端口（对应客户端的remote_port字段）
vhost_http_port = 5000
```

### 6.4 资源请求端配置（Vistor）

资源请求端需配置Docker Hub私库信息，否则将无法拉取资源镜像，出现` http: server gave HTTP response to HTTPS client`错误。出现这问题的原因是：**Docker自从1.3.X之后docker registry交互默认使用的是HTTPS**，但是搭建私有镜像默认使用的是HTTP服务，所以与私有镜像交时出现以上错误。

通过下述方法即可解决该问题：

```shell
# 增加一个daemon.json文件
$ sudo vim  /etc/docker/daemon.json
{
   "insecure-registries": [
       "custom.domain.cn:5000"
   ]
}
```

随后通过`:wq`指令保存，通过`systemctl restart docker`指令重启docker服务刷新配置。

### 6.4 运行

在完成上述配置后且切换至Frp目录下，即可通过下述指令运行Frp。

**服务端：**`./frps -c ./frps.ini`

**客户端：**`./frpc -c ./frpc.ini`

**资源请求端：**`curl custom.domain.cn:5000/v2`

当资源请求端返回数据为`<a href="/v2/">Moved Permanently</a>.`，则说明请求成功，后续可以正常拉取镜像资源。


## web服务配置例子

> 远程公网下服务端配置
```
[common]
# 设置连接端口
bind_port = 7000

# 设置dashboard服务登陆信息
dashboard_port = 7500
dashboard_usr = jen
dashboard_pwd = jen2744

# 设置日志显示级别 [debug, info, warn, error]
log_level = debug
log_max_days = 5

# 设置特权模式是否开启 开通后web,ssh等都可以在客户端设置
privilege_mode = true
privilege_token = jen2744

# 设置转发端口, 公网端口转发
vhost_http_port = 81

# 授权过时
authentication_timeout = 0
```

>内网客户端应用服务器
```
# cat frpc.ini
[common]
server_addr = 106.53.93.81
server_port = 7000
auto_token = jen2744

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 7022

[web]
type = http
local_port = 80
custom_domains = ea.zbsoft.top
```

> 测试
```shell
$ ssh -p 7022 root@106.53.93.81
$ curl http://ea.zbsoft.top:81
```
