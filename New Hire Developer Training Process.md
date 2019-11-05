## 安装及配置

### Git Windows 下载安装

- 安装[Git Windows](https://gitforwindows.org/)后，Git Bash 可用于作为Windows平台下的Linux bash 命令行执行窗口，并提供git 工具。
- 在 Innovation Oriented 群文件搜索 **“git常用命令”** 文档，学习git的使用。

### Note++ 文本编辑器 下载安装

[note++](https://notepad-plus-plus.org)

### 文本对比工具 安装
[Beyond_Compare_2.5.2.252](http://120.79.49.72:8000/devops/Beyond_Compare_2.5.2.252_SC_EV.exe.zip) 常用此工具用作文本对比(如 正常 pom.xml 与 问题 pom.xml 进行对比), 是发现与解决问题的好帮手。


### WinSCP 下载安装
[WinSCP](https://winscp.net/eng/download.php)

### nodejs LTS 下载安装
至 [nodejs官网](https://nodejs.org/en/) 下载最新 **LTS** 版本
使node, npm 可执行

```shell
$ node -v
v12.15.3
$ npm -v
6.4.1
```

### Java 11 JKD (LTS) 安装配置

1. 配置环境变量 JAVA_HOME
2. 在bash下可成功输出如下版本信息

```shell
$ java –version
java version "11.0.2" 2019-01-15 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.2+9-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.2+9-LTS, mixed mode)
$ echo $JAVA_HOME
C:\Program Files\Java\jdk-11.0.2
```

### Apache Maven 安装配置
1. 下载并配置最新版本 maven, 并设置环境变量M2_HOME, 增加路径置设 PATH=%M2_HOME%\bin
2. 通过以下地址下载 maven 配置文件（用于配置 apache archive 私服授权）,并保存于~/.m2目录下。

    [settings.xml](http://zele.pro:8000/devops/settings.xml)

3. 掌握  mvn 命令行的使用

```java
$ echo $M2_HOME
/Users/vincenthuang/Library/apache-maven-3.5.0
$ mvn --version
Apache Maven 3.5.0 (ff8f5e7444045639af65f6095c62210b5713f426; 2017-04-04T03:39:06+08:00)
Maven home: /Users/vincenthuang/Library/apache-maven-3.5.0
Java version: 1.8.0_131, vendor: Oracle Corporation
Java home: /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/jre
```

** 要看当前package的所有依赖，可以通过 | grep “keyword” 过滤 **
```java 
$ mvn clean package install deploy
$ mvn dependency:tree
# -Dverbose参数查看到所有的传递依赖  -Dincludes或者-Dexcludes 过滤指定的依赖，包含或不包含
$ mvn dependency:tree -Dverbose -Dincludes=com.jfeat:jwt-core
$ mvn dependency:tree | cat -n | grep “org.json”
```

### JAVA 代码编辑器 Intellij Idea Community 安装配置
下载最新版本 [IntelliJ IDEA](https://www.jetbrains.com/idea/)

- 掌握 Reflector ——  快捷键 Shift+F6 
- 掌握全文搜索引用 —— 快捷键 Alt+F7
- 掌握智能补全代码 —— 快捷键 Alt+Enter
- 掌握查看方法定义 —— 快捷键 Ctrl+LeftButton or Ctrl + B
- 掌握查看方法实现 —— 快捷键 (Ctrl+Atl+LeftButton or Ctrl + Alt + B)
- 掌握调试方法     —— 快捷键 F7, F8, F9

### 数据库 MySQL 5.7 安装 (可选)
可在本地PC安装 **MySQL 5.7** 以上版本, 也可以直接连接专属测试 **MySQL Server** 远程连接：

| **序号** | **连接字段**                                                 |
| -------- | ------------------------------------------------------------ |
| Power    | jdbc:mysql://120.79.49.72/test?user=root&password=root&characterEncoding=utf8 |

进一步安装 **navicat** 数据库远程连接工具, 常用远程连接数据库，数据库备份操作等


## Linux 基础

### 虚拟机安装与使用
- 选用 VMware 或 VirtualBox 工具安装Linux操作系统
- 掌握虚拟机的 **端口转发** 原理及其配置

### 理解 linux平台命令的参数意义
```shell
$ curl --help
Usage: curl [options...] <url>
```
```xml
<>  内参数代表**必填**参数
```
```xml
[]  内参数代表**选填**参数
```

### 常用操作符
| 操作符 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| \|     | pipe/管道,命令行的输出作为另一个命令行的输入<br />$ cat out.md |
| >      | 内容完全覆盖已存在文件或新建文件<br />$ echo “ok” >/path/to/new.md |
| >>     | 内容追加到已存在文件内容末端<br />$ echo “ok” >>/path/to/out.md |
| &      | 加在命令行之后，让命令在后台运行<br />$ java –jar app.jar &  |
| $      | $ export PW=OK123; echo $PW<br />OK123

### 掌握Linux操作系统常用命令
```shell
Basic:  ls, cd, rm, mkdir, echo, cat
Advance: vi, ps, grep, find, xargs, chmod, sed
Network: curl, netstat, wget, scp
```
* 了解Linux OS基础:  .bashrc, export, sh, bash, $@, @#, $1, /dev/null 等
* 重点掌握 vi 编辑工具的使用, 以及网络工具 curl 的使用

Q: 如何查找当前目录下的哪个文件包括字符串？
```shell
$ ls *.json | xargs grep “string you want to search”
```
Q: 如何查找当前目录下(包括所有子目录) 的哪个文件包括字符串？
```shell
$ find . –name “*.json” | grep “string you want to search”
```
Q: 如何替换当前目录下(包括所有子目录)所有 .js 文件中的指定内容？
```shell
$ find . –name “*.json” | sed -i “s/oldstring/newstring/g”
```

### 如何登录远程服务器
在 **Innovation Oriented** 群文件搜索 **“PuTTY自动登录SSH服务器”** 文档，了解**ssh**概念

1)   学习使用 putty, 或其他 ssh 登录工具
2)   学习 scp 或 WinScp (Windows平台可视化scp,可下载安装) 的使用
3)   掌握 ssh-keygen 的 以及 id_rsa.pub  key 的使用

### ssh无密码登陆
- 通过ssh协议登陆服务器的前提是服务器已开通ssh服务，大部分linux平台默认配备ssh服务
- SSH协议允许终端通过密匙对免输密码直接登录服务器 
- 密匙对基于终端，分别为 public key 和 private key，终端public key 置入服务器授权终端列表后，可携带private key合法登录服务器

- 创建SSH KEY
查看~/.ssh目录下是否有id_rsa、id_rsa.pub文件，没有需要手动生成，执行如下命令：
~~~
ssh-keygen -t rsa -C "youremail@example.com"
~~~
​	-t 指定密钥类型。如果没有指定则默认生成用于SSH-2的RSA密钥。这里使用的是rsa。
​	-C来指定所指定的注释，可以方便用户标识这个密钥，指出密钥的用途或其他有用的信息。所以在这里输入自己的邮箱或者其他都行。
​	输入完毕后程序同时要求输入一个密语字符串(passphrase)，空表示没有密语。接着会让输入2次口令(password)，空表示没有口令。3次回车即可完成当前步骤。
​	此时密钥对就生成好了。

- 将终端公钥置入服务器授权终端列表
将终端 id_rsa.pub 公钥内容拷贝到服务器 ~/.ssh/authorized_keys 文件中，即可免密登陆。


## 开发与调试

### 理解CRUD数据库设计与开发
在 **Innovation Oriented** 群文件搜索 **CRUD Introduction.ppt** 文档，理解 CRUD 设计与开发编程概念。

### API开发与调试

- 在bash命令提示符下git clone 如下代码
```shell
$ git clone devops@zele.pro:/home/devops/repo/env/env-test-saas.git
```
打开 intellij idea 用 **maven** 导入工程

- 运行API Endpoint
最新出现Test SaaS is success! 表示运行成功

- 在线查看 swagger 文档
```shell
http://127.0.0.1:8080/swagger-ui.html
```
127.0.0.1 需替换为本机局域网IP（若局域网IP内其他主机访问）

- 掌握 resetful 测试工具
推荐使用开源工具 [Insomnia](https://www.insomnia.rest/)

- 理解配置文件的基础配置
```java
src/main/resources/application.yml
```

- 如何指定运行端口
```xml
server:
   port: 8080
```
- 也可以在执行时指定:
```shell
$ java -jar target/app-standalone.jar --server.port=8081
```

- 如何指定运行配置选项
```xml
spring:
   profiles:
      active: dev
---
spring:
  profiles: dev
  datasource:
      url: jdbc:mysql://120.79.49.72/test?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull
      username: root
      password: root
      filters: log4j,wall,mergeStat
      sql-script-encoding: UTF-8
      schema: classpath*:sql/**/*-schema.sql
      data: classpath*:sql/**/*-data.sql
      initialize: false

logging:
  level: debug
  file: logs/trace.log
```
以上配置改为 true 代表应用的 所有依赖模块 所属数据库表被重置
initialize: true

- 也可以在命令行执行时指定：
```shell
 $ java -jar target/app-standalone.jar –spring.profiles.active=produce
```


## 开发规范要求

### 遵循定义的准则
- [工作行为准则](https://github.com/kequandian/dev_docs/blob/master/%E5%B7%A5%E4%BD%9C%E8%A1%8C%E4%B8%BA%E5%87%86%E5%88%99.md)
- [数据库设计规范](https://github.com/kequandian/dev_docs/blob/master/%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1%E8%A7%84%E8%8C%83.md)
- [业务开发从表单开始](https://github.com/kequandian/dev_docs/blob/master/业务开发从表单开始.md)
- [项目开发流程](https://github.com/kequandian/dev_docs/blob/master/%E9%A1%B9%E7%9B%AE%E5%BC%80%E5%8F%91%E6%B5%81%E7%A8%8B.md)
- [编程风格错误范例](https://github.com/kequandian/dev_docs/blob/master/%E7%BC%96%E7%A8%8B%E9%A3%8E%E6%A0%BC%E9%94%99%E8%AF%AF%E8%8C%83%E4%BE%8B.md)

### 掌握开源测试报告工具的使用
 [zero-test](https://github.com/kequandian/zero-test)
 对非CRUD重要业务逻辑 需提供测试报告

### 代码编写规范
- 多字符串连接禁止使用+，使用 **String.format** 或者 **StringBuilder** 进行连接
- 字符串常量以及数字常量需定义变量加以说明
```java
//不规范示例
private void doSomeUpdate(){
   device.setDeviceType(1);
   device.setDeviceStatus("normal");
}

//正确规范
public enum DeviceStatus{
  NORMAL,
  OFFLINE,
  ONLINE
}

private static final int DEVICE_TYPE_CAMERA =  1;
private static final int DEVICE_TYPE_PC = 2;

private void doSomeUpdate(){
   device.setDeviceType(DEVICE_TYPE_PC);
   device.setDeviceStatus(DeviceStatus.NORMAL.toString());
}
```
- 路径分隔符禁止使用 \ 和 / ，统一使用 **File.separator**
- JSON空实体不能用空字符串 "", 应该用: {}
  ```shell
  e.g.  {"id":0, "name":"entity", "meta": {} }
  ```
- * 代码级别多抛常**Exception**或**RuntimeException**出防止参数错误或逻辑性错误
- 尽量多写log，标记重要代码段信息输出, 以免 **消息日志不够完整，遇到问题难定位**


#### 防范空指针
* 禁止连续使用点(.)操作以避免空针错误，多点操作改为分多段代码并加非空判断
* 尽量多判断输入参数或返回对象是否为null, 如果输入参数或返回对象不能为空，则抛出异常(throw new RuntimeException())；
* 禁止使用多点操作，因为多点操作很容易出现空针指；对多点操作应分开多行获取对象，并对获取的对象进行非空判断

### 掌握部署方法
- 掌握 docker 原理
- 掌握 docker 基本 cli 操作命令
- 掌握 docker-compose 部署编排 参考 [docker.io/zelejs/app-openjre11](https://hub.docker.com/r/zelejs/app-openjre11)
   
### 学习 vert.x 开发
[My first Vert.x 3 Application](https://vertx.io/blog/my-first-vert-x-3-application/)

