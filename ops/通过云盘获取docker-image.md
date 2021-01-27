## 通过云盘获取 docker image 相关说明
> 常用Docker镜像云盘下载地址
>
[https://share.weiyun.com/pqO40zka](https://share.weiyun.com/pqO40zka)

#### 加载docker镜像 
> 代替 docker pull，解决网络环境问题
```
$ docker load --help

Usage:  docker load [OPTIONS]

Load an image from a tar archive or STDIN

Options:
  -i, --input string   Read from tar archive file, instead of STDIN
  -q, --quiet          Suppress the load output

$ docker load -i /path/to/the_downloaded_docker_image
```

