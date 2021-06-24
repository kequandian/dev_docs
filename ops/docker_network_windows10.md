#### 获取 windows10 的 docker 网络路由
- 在容器内部 ping `host.docker.internal`
- 或
```shell
 docker run --rm alpine ping -c 3 host.docker.internal
```
