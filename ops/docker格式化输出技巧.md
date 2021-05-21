## docker 格式化输出
- https://docs.docker.com/config/formatting/

#### docker images 格式化
- https://docs.docker.com/engine/reference/commandline/images/
```shell
$ docker images --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
```
