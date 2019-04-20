## 安装及配置

### Git Windows 下载安装

1. 安装Git Windows后，Git Bash 可用于作为Windows平台下的Linux bash 命令行执行窗口，并提供git 工具。
2. 在 Innovation Oriented 群文件搜索“git常用命令”文档，学习git 使用。

### Java1.8 jdk 配置

1. 配置环境变量 JAVA_HOME
2. 在bash下可成功输出如下版本信息

```java
$ java –version
java version "1.8.0_161"
Java(TM) SE Runtime Environment (build 1.8.0_161-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.161-b12, mixed mode)
```

### Apache Maven 配置

1. 下载并配置最新版本 maven, 并设置环境变量M2_HOME, 增加路径置设 PATH=%M2_HOME%\bin
2. 通过以下地址下载 maven 配置文件（用于配置 apache archive 私服授权）,并保存于~/.m2目录下。

> http://zele.pro:8000/devops/settings.xml

3. 掌握  mvn 命令行的使用

```java
$ mvn clean package install deploy
$ clean、package、install、deploy 分别代表什么意义
$ mvn dependency:tree  ## 要看当前package的所有依赖，可以通过 | grep “keyword” 过滤
e.g.
$ mvn dependency:tree | grep “org.json”
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
| Power    | jdbc:mysql://<br/>120.79.77.207/test?user=root&password=root&characterEncoding=utf8 |

## 服务器操作

### 掌握通过ssh协议如何登录远程服务器

在Innovation Oriented 群文件搜索 “PuTTY自动登录SSH服务器” 文档，了解ssh概念

1)         学习使用 putty, 或其他 ssh 登录工具

2)         学习 scp 或 WinScp (Windows平台可视化scp,可下载安装) 的使用

3)         掌握 ssh-keygen 的 以及 id_rsa.pub  key 的使用

### 掌握基本的 Linux 常用命令，并在git bash上运用

```java
Basic:  ls, cd, rm, mkdir,echo,cat,grep, find, xargs,vi
Advance:  chmod,curl,wget, sed, /dev/null, sh, bash
Useful:  grep,find, xargs,vi, sed
```

Q: 如何查找当前目录下的哪个文件包括字符串？

> $ls *.json | xargs grep “string you want to search”

Q: 如何查找当前目录下(包括所有子目录) 的哪个文件包括字符串？

> $find . –name “*.json” | grep “string you want to search”

Q: 如何替换当前目录下(包括所有子目录)所有 .js 文件中的指定内容？

> $find . –name “*.json” | sed -i “s/oldstring/newstring/g”

### 操作符用法说明

| 操作符 | 说明                                                         |
| ------ | ------------------------------------------------------------ |
| >      | 内容完全覆盖已存在文件或新建文件<br />$ echo “ok” >/path/to/new.md |
| >>     | 内容追加到已存在文件内容末端<br />$ echo “ok” >>/path/to/out.md |
| \|     | pipe/管道,命令行的输出作为另一个命令行的输入<br />$ cat out.md |
| &      | 加在命令行之后，让命令在后台运行<br />$ java –jar app.jar &  |
| $      | $ export PW=OK123; echo $PW<br />OK123                       |

## 调试API

### 在bash命令提示符下git clone 如下代码

$ git clone devops@120.79.49.72:/home/devops/repo/env/env-test-dao.git

打开 intellij idea用maven 导入工程

### 运行API Endpoint

最新出现Test Dao is success! 表示运行成功

### 用Postman API测试工具对API进行测试

在 Innovation Oriented 群文件搜索关键字“postman” 文档，学习postman的使用，并对Test Dao API进行测试。

### 理解配置文件的基础配置

src/main/resources/application.yml

**如何指定运行端口**

```java
server:
	port: 8080
```

也可以在执行时指定：

$ java -jar target/app-standalone.jar --server.port=8081

**如何指定运行配置选项**

```java
spring:
	profiles:
		active: dev
```

也可以在执行时指定：

 $java -jar target/app-standalone.jar –spring.profiles.active=produce

**如何初始化数据库表**

设置 Initailize: true, 运行APP所有依赖的模块的所有数据库表都重新建立（原有表数据重置）。

### 通过 Navcat 连接本地或远程数据库

#### 连接数据库

1. 选择数据库类型

2. 填写必要的链接信息

   连接名:即你希望在Navicat界面显示的名称

   主机或IP地址:需要连接的数据的IP，例如:本地数据库可使用 localhost或127.0.0.1

   用户名及密码:用户名及密码，相当于bash 命令下 -u  -p

3. 填写完成后点击连接测试

出现如图所示”连接成功”的信息证明配置成功。

#### 使用Navicat执行SQL语句

双击配置好的数据库，右键新建数据库，并点击查询按钮:

依次点击  新建查询

生成执行sql语句的窗口，将需要执行的sql拷贝到该窗口，Ctrl + R 执行sql 语句。

#### 导出数据库或单表

导出整个数据库结构及数据:

选定需要导出的数据库，右键

注意:选择结构和数据相当于将整个数据库dump下来。仅结构只会打印出该数据库的建表语句

导出单表，操作类似，选中需要导出的单表，然后按照导出整个数据库的方法依次执行即可。

## 代码自动生成工具的使用

### sb-code-generator 插件的使用

在 Innovation Oriented 群文件搜索关键字“代码生成插件” 文档，学习sb-code-generator的使用

### cg-cli自动生成代码脚本的使用

cg-cli 是以脚本的开式生成代码，基于sb-code-generator 插件进行二次开发，比sb-code-generator 插件更加简单快捷。cg-cli 将依据项目开发过程不断完善，满足越来越多的业务需求。

> git clone git@github.com:kequandian/cg-cli.git

**使用说明：**

- 查看脚本命令，在根目录下输入：./cg-cli

- 配置数据源，在根目录下输入：./cg-cli db set config \<database> [localhost]

- 测试连接，在根目录下输入：./cg-cli db sanity

- 查看数据库表，输入：./cg-cli db show tables

- 指定模块名，输入：./cg-cli module set \<module-name>

- 生成单表crud，输入：./cg-cli crud one \<table-name> --gen

- 生成一对多crud，输入：./cg-cli crud onemany \<master> <slave:mid> --gen

  ​     master：主表名称

  ​     slave：从表名称

  ​     mid：主表id在从表中对应的字段

- 生成多对多crud，输入：./cg-cli crud manymany \<master> \<peer> \<relation> --gen

  ​     master：主表名称

  ​     peer：另一个表名称

  ​     relation：多对多关系表名称

- 其他使用方法直接查看脚本用法说明。

**自动生成工具失败原因：**

执行指令时提示失败：

1. 数据库未连接，数据源配置有误，请使用 ./cg-cli db get config检查配置
2. 指定生成的table不存在

执行成功，但未生成代码：

1. 本地maven repository存在sb-code-generator包，找到它并删除，从新执行生成代码指令

## 开发流程

1. 至少每天下班前提交一次代码

2. 原则上实现了一个小功能，或完成了一个小任务需要提交代码一次

3. 提交的代码要写 comment 

   git commit –m “write down current task comment”

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
- 提交JSON空子实体不能用 ””

