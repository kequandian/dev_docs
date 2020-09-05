- **服务端**

```shell
# 编辑frps.ini配置文件
$ vim frps.ini
```

配置如下。

```ini
[common]
# 默认绑定通信端口号
bind_port = 7000
# for privilege mode，和客户端一致
privilege_token = jen2744     
```

 - **客户端**

```shell
# 编辑frpc.ini配置文件
$ vim frpc.ini
```

配置如下所示。

```ini
[common]
server_addr = 120.67.78.78
server_port = 7000
# for privilege mode，和服务端一致
privilege_token = jen2744     

# 配置 ssh
[ssh] 
type = tcp
local_ip = 192.168.3.3 # 绑定的ip，填写127.0.0.1表示本机即可
local_port = 22
remote_port = 6000 # ssh默认是6000，转发为22端口
```
>  ##### 1. server_port 和 remote_port 端口， 服务器必须要开放这两个端口    [window开放端口教程](https://www.itread01.com/content/1553752929.html)
>  ##### 2. **确保客户端机器已开启SSH服务**
>  ##### 3. **[ssh]** 可自定义

完成上述步骤后，并确定端口正常使用的情况下，切换至Frp目录下，可以执行如下命令启动服务端与客户端的Frp。
**（Tips：先启动服务端）**

- **服务端启动**

```shell
$ ./frps -c ./frps.ini
```

- **客户端启动**

```shell
$ ./frpc -c ./frpc.ini
```
- **测试**
```shell
# 在别的服务器上连接内网SSH
$ ssh root@120.67.78.78 -p 6000
root@xxx.xxxx's password: 
```
