## 安装及配置

### Git Windows 下载安装

- 安装[Git Windows](https://gitforwindows.org/)后，Git Bash 可用于作为Windows平台下的Linux bash 命令行执行窗口，并提供git 工具。
- 在 Innovation Oriented 群文件搜索 **“git常用命令”** 文档，学习git的使用。

### Note++ 文本编辑器 下载安装

[note++](https://notepad-plus-plus.org)

### WinSCP 下载安装
[WinSCP](https://winscp.net/eng/download.php)

### Java 11 JKD (LTS) 配置

1. 配置环境变量 JAVA_HOME
2. 在bash下可成功输出如下版本信息

```java
$ java –version
java version "11"
Java(TM) SE Runtime Environment (build 11.0_161-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.161-b12, mixed mode)
```

### Apache Maven 配置

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
$ mvn dependency:tree | cat -n | grep “org.json”
```

### 安装最新版本 Intellij Idea Community

1. 掌握 Reflector 的快捷方式用法 (Shift+F6) 
2. 掌握全文搜索引用 的快捷方式用法  (Alt+F7)
3. 掌握智能补全代码 的快捷方式用法  (Alt+Enter)
4. 掌握查看方法定义 的快捷方式用法  (Ctrl+LeftButton or Ctrl + B)
5. 掌握查看方法实现 的快捷方式用法  (Ctrl+Atl+LeftButton or Ctrl + Alt + B)

### MySQL 5.7安装 (可选)

可在本地安装 MySQL5.7, 也可以直接利用远程MySQL Server

可用连接字段如下列

| **序号** | **连接字段**                                                 |
| -------- | ------------------------------------------------------------ |
| Power    | jdbc:mysql://120.79.49.72/test?user=root&password=root&characterEncoding=utf8 |

## 服务器操作

### 掌握通过ssh协议如何登录远程服务器

在Innovation Oriented 群文件搜索 “PuTTY自动登录SSH服务器” 文档，了解ssh概念

1)         学习使用 putty, 或其他 ssh 登录工具

2)         学习 scp 或 WinScp (Windows平台可视化scp,可下载安装) 的使用

3)         掌握 ssh-keygen 的 以及 id_rsa.pub  key 的使用

### ssh无密码登陆

通过ssh协议登陆服务器的前提是服务器已开通ssh服务，大部分linux平台默认配备ssh服务

SSH协议允许终端通过密匙对免输密码直接登录服务器 

密匙对基于终端，分别为 public key 和 private key，终端public key 置入服务器授权终端列表后，可携带private key合法登录服务器

1. **创建SSH KEY**

   查看~/.ssh目录下是否有id_rsa、id_rsa.pub文件，没有需要手动生成，执行如下命令：

~~~
ssh-keygen -t rsa -C "youremail@example.com"
~~~

​	-t 指定密钥类型。如果没有指定则默认生成用于SSH-2的RSA密钥。这里使用的是rsa。

​	-C来指定所指定的注释，可以方便用户标识这个密钥，指出密钥的用途或其他有用的信息。所以在这里输入自己的邮箱或者其他都行。

​	输入完毕后程序同时要求输入一个密语字符串(passphrase)，空表示没有密语。接着会让输入2次口令(password)，空表示没有口令。3次回车即可完成当前步骤。

​	此时密钥对就生成好了。

2. **将终端公钥置入服务器授权终端列表**

   将终端id_rsa.pub公钥内容拷贝到服务器~/.ssh/authorized_keys文件中，即可免密登陆。

### 掌握基本的 Linux 常用命令，并在git bash上运用

```java
Basic:  ls, cd, rm, mkdir,echo,cat,grep, find, xargs,vi
Advance:  chmod,curl,wget, sed, /dev/null, sh, bash
Useful:  grep,find, xargs,vi, sed
```

Q: 如何查找当前目录下的哪个文件包括字符串？

```
$ ls *.json | xargs grep “string you want to search”
```

Q: 如何查找当前目录下(包括所有子目录) 的哪个文件包括字符串？

```
$ find . –name “*.json” | grep “string you want to search”
```

Q: 如何替换当前目录下(包括所有子目录)所有 .js 文件中的指定内容？

```

$ find . –name “*.json” | sed -i “s/oldstring/newstring/g”
```

### 操作符用法说明 理解管道的使用方法

| 操作符 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| \|     | pipe/管道,命令行的输出作为另一个命令行的输入<br />$ cat out.md |
| >      | 内容完全覆盖已存在文件或新建文件<br />$ echo “ok” >/path/to/new.md |
| >>     | 内容追加到已存在文件内容末端<br />$ echo “ok” >>/path/to/out.md |
| &      | 加在命令行之后，让命令在后台运行<br />$ java –jar app.jar &  |
| $      | $ export PW=OK123; echo $PW<br />OK123                       |

## 调试API

### 在bash命令提示符下git clone 如下代码

```
$ git clone devops@zele.pro:/home/devops/repo/env/env-test-saas.git
```

打开 intellij idea用maven 导入工程

### 运行API Endpoint

最新出现Test SaaS is success! 表示运行成功

### 掌握 resetful 测试工具 
推荐使用开源工具 [Insomnia](https://www.insomnia.rest/)

### 理解配置文件的基础配置

src/main/resources/application.yml

**如何指定运行端口**

```java
server:
	port: 8080
```

也可以在执行时指定：

```
$ java -jar target/app-standalone.jar --server.port=8081
```

**如何指定运行配置选项**

```java
spring:
   profiles:
      active: dev
```
也可以在执行时指定：

```
 $ java -jar target/app-standalone.jar –spring.profiles.active=produce
```

**如何初始化数据库表**

设置 Initailize: true, 运行APP所有依赖的模块的所有数据库表都重新建立（原有表数据重置）。

### 通过 navcat 连接本地或远程数据库
掌握 navcat 的使用

### 如何在本地启动调试一个简单网页
- 安装 
```
$ npm -i http-server
```

- 启动
进入网页目录，在命令行下执行 
```
$ http-server
```

- 测试
打开浏览器， 在浏览地址输入 127.0.0.1:8080

## CRUD代码生成工具的使用

```
$ git clone git@github.com:kequandian/cg-cli.git
$ npm i -g
```

**另外需掌握前端配置工具** [快速开发框架](http://console.smallsaas.cn)

## 代码提交要求
1. 至少每天下班前提交一次代码

2. 原则上实现了一个小功能，或完成了一个小任务需要提交代码一次

3. 提交的代码要写 comment 

```
$ git commit –m “write down current task comment”
```

### 理解开发质量
1. 深入理解 Exception, RuntimeException 的用法，局部(internal)功能实现需要多抛出(throw) 异常，可有效保证外部(external)输入参数正确
2. 多写非空判断，尽量避免空针错误。禁止连接使用点(.)操作
3. 多写log，标记重要代码段信息输出

### 阅读并遵循开发规范
《Efficiency Development Checklist》

《数据库设计规范》

学习《CRUD Introduction》,了解一对多/多对多/分组等数据库表关系

### 关于处理问题的方法流程
==原则==

**原则一** 尽量少花时间在技术问题上面，因为技术问题大家都遇到过，无必要再花大量时间研究技术问题

**原则二** 遇到业务问题需掌握基本的测试方法，理解单元测试的意义，通过单元测试逐步排除或缩小问题范围。不断重复无建设性的综合测试，无分析思路，是作为 New Hire 常见的现象，应当努力避免！

**技术问题定义**
- 编辑器问题
- java 配置问题
- maven 配置问题
- 项目导入问题或配置问题（application.yml配置）
- 数据库连接问题
- SQL语法问题
- 编码(utf-8)问题（如乱码）
- 程序运行问题

### 关于遇到的技术问题处理流程
遇到技术问题首先查看 《Efficiency Development Checklist》文档，看是否已有解决方法

遇到技术问题如果没有解决思路，不应该花没有建设性的时间，不断重复尝试而没有任何进展

遇到技术问题没有解决思路，应该主动提出讨论，直接与有经验的同事沟通或在技术群里讨论

讨论的方法参考如下：

- 出现问题的具体描述，最直接的方法是提交截图
- 报错日志/截图建议着重提示关键字，划出重点注意的地方（不建议没有通过思考直接截图）
- 问问题的时候，给别人的条件越多，你的问题解决越快
- 可以提供一下解决过程（**非必要**）（尝试过什么方法来解决；尝试过的方法，最终结果是怎么样）？
- 最终解决了及时回复是否已解决

### Idea使用
- 如何在 idea intellij 全局代码变更类名或变量的方法: 选中变量或类名，shift+f6,修改变量名即可

### 代码规范
- 多字符串连接禁止使用+，使用String.format或者StringBuilder进行连接
- 路径分隔符禁止使用\和/，统一使用File.separator
- 谨防多点操作，容易报空指针错误,注意Long Integer与  int  long 引起的空指针问题
- JSON空实体不能用 ””, 因为 "" 代表空字符串, 提交空字符串到实体将导致JSON格式解释错误。应该用: {}
  e.g.  {"id":0, "name":"entity", "meta": {} }
 
### CRUD 编辑规范
- CRUD实体新建请求 在 api 目录新建请求类 ${Entity}Request (e.g. DeviceRequest), 通过swagger 向前端提供紧凑的参数请求（过滤 id, 时间等)
- CRUD实体列表查询请求 使用扁平类 ${Entity}Record (e.g.  DeviceRecord)
- CRUD一对多实体，使用 ${Entity}Model （e.g. DeviceModel)
- 程序错误提示编码需依据 业务错误编码规范[Business Code](https://github.com/kequandian/dev_docs/blob/master/Business%20Code.md), 不能自定义。

### CRUD 编辑规
