## 关于wsl 2的说明

### 进入wsl
```shell
docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -i sh
```
