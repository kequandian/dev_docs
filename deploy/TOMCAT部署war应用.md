## 部署 `WAR` 应用

#### 下载 tomcat:9
[apache-tomcat-9.0.52-windows-x64.zip](https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52-windows-x64.zip)

#### 准备应用配置文件`config/config.properties`
```
├── bin
│   ├── setenv.sh
│   ├── shutdown.sh
│   └── startup.sh
├── conf
│   └─ Catalina
│     └── localhost
│         └── images.xml
├── config
│   └── config.properties
├── lib
├── logs
├── temp
├── webapps
│   ├── images
│   └── ROOT.war
├── work
└── README
```

#### 配置图片目录
```shell
$ cat conf/Catalina/localhost/images.xml
<Context path="/images" docBase="images" reloadable="true"/>  
```

#### 在`bin`目录下增加环境配置文件`setenv.sh`
> 如要调试，取消注释`export CATALINA_OPTS`
```shell
$ cat bin/setenv.sh
#!/bin/sh
#dir=$(cd `dirname $0`; pwd)
dir=$(dirname $(readlink -f $0))
config=$(readlink -f $dir/../config/config.properties)

export JAVA_OPTS="$JAVA_OPTS -Djfeat.config.properties=$config"
# export CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=*:5005,suspend=n"
```

#### 把目标调试`.war` 更名为 `webapps/ROOT.war`
> 清除 `webapps`下的示例文件（或保留 `host-manager`, `manager`）

#### 启动服务
> 必须`sudo`启动
```shell
cd bin
sudo ./startup.sh
```
  
#### 停止服务
```shell
cd bin
sudo ./shutdown.sh
```

#### 查看启动日志
```
tail -f -n 100 logs/Catalina.out
```
