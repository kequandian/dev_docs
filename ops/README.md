##### 安装容器环境脚本 

```shell
#!/usr/bin/python3
import os
os.system('curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -')
os.system('curl -L https://github.com/docker/compose/releases/download/1.26.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose')
os.system('sudo chmod +x /usr/local/bin/docker-compose')
```

