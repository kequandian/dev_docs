## 本地调试 TOMCAT 应用

#### 下载 tomcat:9
[apache-tomcat-9.0.52-windows-x64.zip](https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52-windows-x64.zip)

#### 准备应用配置文件`config/config.properties`
```
├── bin
│   ├── setenv.sh
├── conf
├── config
│   ├── config.properties
├── lib
├── logs
├── temp
├── webapps
│   └── ROOT.war
├── work
└── README
```

#### 在`bin`目录下增加环境配置文件`setenv.sh`
> 与`idea intellij` 的调试端口设置为`*:5005` (*:<PORT>可远程访问)
> 
```
$ cat bin/setenv.sh
#!/bin/sh
#dir=$(cd `dirname $0`; pwd)
dir=$(dirname $(readlink -f $0))
config=$(readlink -f $dir/../config/config.properties)

export JAVA_OPTS="$JAVA_OPTS -Djfeat.config.properties=$config"
#export CATALINA_OPTS=" -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"
export CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,address=*:5005,suspend=n"
```

#### 把目标调试`.war` 更名为 `webapps/ROOT.war`
> 清除 `webapps`下的示例文件（或保留 `host-manager`, `manager`）


#### 在本地启动`catalina.sh`
```
cd bin
./catalina.sh run
```

#### 在浏览器中测试`war`服务是否启动成功
> 在地址栏输入
```
http://localhost:8080
```


## 本地调试
> 通过连接正在运行的`tomcat` WAR包服务


#### `idea intellij` 编辑器导入`maven`项目源代码
在`Edit Configurations...`中的`Templates`选择`Remote`
>
设置调试端口为 **`5005`** (与`setenv.sh`中的设置对应)


其他设置
```
Debugger mode: Attach to remote JVM
Transport: Socket
Host: localhost   Port: 5005
```
## Install on Raspberrypi
  1 Download Tomcat package from official website https://tomcat.apache.org/download-90.cgi
  2 use tar to unzip file folder
  3 Create necessary folder and copy necessary files to the unzip folder according to the above foler structure.
  4 add "@reboot cd ~/apache-tomcat-9.0.53/bin && sudo ./startup.sh" in crontab to make sure the tomcat started when machine power on.
  
