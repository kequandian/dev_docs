
## 设置Docker容器日志大小
> 逐个设置或全局设置

#### 设置一个容器服务的日志大小上限
```yaml
nginx:
   image: nginx:1.12.1
   restart: always
   logging:
      driver: "json-file"
      options:
        max-size: 100m
        #max-file: 3
```

#### 清理没用的资源
```shell
docker system df 
cd /var/lib/docker
docker system prune -a
```

#### 全局设置Docker容器日志大小
```json
# cat /etc/docker/daemon.json
{
   "log-driver":"json-file",
   "log-opts": {"max-size":"100m", "max-file":"3"}
}
```

#### 解决日志占满问题,  避免写log到 docker，或通过docker 定期清除 log

```sh
$ ls /var/lib/docker/containers/<id>/*-json.log
$ cd /var/lib/docker
$ rm containers/<id>/*-json.log
$ sudo du -ah --max-depth=1
$ docker container restart <id>


$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        99G   99G     0 100% /
devtmpfs        3.7G     0  3.7G   0% /dev
tmpfs           3.7G     0  3.7G   0% /dev/shm
tmpfs           3.7G  365M  3.4G  10% /run
tmpfs           3.7G     0  3.7G   0% /sys/fs/cgroup
tmpfs           756M     0  756M   0% /run/user/1001
tmpfs           756M     0  756M   0% /run/user/1000

$ sudo du -ah --max-depth=2
4.0K    ./machines
4.0K    ./alternatives/print
4.0K    ./alternatives/pax
4.0K    ./alternatives/mta
4.0K    ./alternatives/libnssckbi.so.x86_64
4.0K    ./alternatives/ld
4.0K    ./alternatives/gnuplot
28K     ./alternatives
4.0K    ./NetworkManager/dhclient-eth0.conf
4.0K    ./NetworkManager/NetworkManager.state
4.0K    ./NetworkManager/timestamps
4.0K    ./NetworkManager/dhclient-0ee3dd08-34cc-4125-bd76-96d4bd26afc5-eth0.lease
4.0K    ./NetworkManager/NetworkManager-intern.conf
24K     ./NetworkManager
4.0K    ./authconfig/last
8.0K    ./authconfig
4.0K    ./rpm-state
```
