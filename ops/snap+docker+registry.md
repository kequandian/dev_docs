### 设置
> /var/snap/docker/current/config/daemon.json
> 
```json
{
    "log-level": "error",
    "storage-driver": "overlay2",
    "insecure-registries": ["192.168.3.19:5000"]
}
```

### 重启
```shell
sudo docker restart docker
```


