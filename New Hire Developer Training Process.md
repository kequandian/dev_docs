###  基本开发技能 `Checklist`
| Item                                      | Yes/No | Training Plan | Comment  |
| ----------------------------------------- | ------ | ------------- | ---------- |
| 是否可以实现键盘盲打                        | 是     | 1周           | 5天     |
| 是否掌握JAVA调试方式（基于 intellij IDEA)   | 否     | 1天           | F7,F8,F9的使用技巧 |
| 是否理解抛出异常`BusinessException`的意义   | 是     | 2天           | `Bad Request`保证用户输入正确 |
| 是否掌握`一对多`数据库设计与自动化代码生成   | 否      | 2天          |  | 
| 是否正确测试`一对多`的API逻辑               | 是     | 2天          |   | 
| 是否掌握数据库联表查询 LEFT JOIN            | 否     | 1周          |  |
| 熟练掌握`myBatis`中的`Mapper`查询技巧       | 否     | 2天          | `QueryWrapper`与`LamdaQueryWrapper`的区别 |  
| 是否熟悉`Stream`以及`Lambda`的使用          | 否    | 1周           | `stream.of("one", "two").filter(u->u.toUpper()).sorted().collect(Collections.toList())` |
| 是否掌握测试技巧，F12查看浏览器中network信息 | 否     | 1天          |   |
| 是否掌握测试技巧，检证数据库的更新并理解API逻辑 | 否   | 1天          |   |
| 是否掌握`JUNIT`单元测试                    | 否     | 1周          |            |
| 是否掌握junit Assert的使用                 |  是    | 2天           | Assert.isTrue("Submitted".equals(status), "参数不正确") |
| 是否熟练使用`git`提交代码                   | 否     | 1周          |  `git status`, `git diff`, `git checkout .` |
| 是否熟悉`ssh`原理与应用场景                 | 否     | 1周          |            |
| 是否熟悉`docker`原理与应用                  | 否     | 2周          |            |

## 开发环境安装及配置

### Git Windows 下载安装
比较常用，相当于windows小型linux，并提供git工具
- [Git Windows](https://gitforwindows.org/)Git 

### VSCode 下载安装
很多插件可以利用, 可用于开发，也可当作文本编辑器
- [VSCode](https://code.visualstudio.com/)

### WinSCP 下载安装
用于远程服务器的上传下载
- [WinSCP](https://winscp.net/eng/download.php)

### 文本对比工具 安装
常用此工具用作文本对比(如 正常 pom.xml 与 问题 pom.xml 进行对比), 是发现与解决问题的好帮手。
- [Beyond_Compare_2.5.2.252](http://120.79.49.72:8000/dl/Beyond_Compare_2.5.2.252_SC_EV.exe.zip) 

### Java 11 JKD (LTS) 安装配置
- [java11 jdk](http://jdk.java.net/java-se-ri/11)
- 配置环境变量 `JAVA_HOME`

在`bash`下可成功输出如下版本信息
```shell
$ java –version
java version "11.0.2" 2019-01-15 LTS
Java(TM) SE Runtime Environment 18.9 (build 11.0.2+9-LTS)
Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.2+9-LTS, mixed mode)
$ echo $JAVA_HOME
C:\Program Files\Java\jdk-11.0.2
```

### JAVA 代码编辑器 Intellij Idea Community 安装配置
- 下载最新版本 [IntelliJ IDEA](https://www.jetbrains.com/idea/)

> `Intellij IDEA` 常用快捷方式
- 掌握 Reflector  ——  快捷键 Shift+F6 
- 掌握全文搜索引用 —— 快捷键 Alt+F7
- 掌握智能补全代码 —— 快捷键 Alt+Enter
- 掌握查看方法定义 —— 快捷键 Ctrl+LeftButton or Ctrl + B
- 掌握查看方法实现 —— 快捷键 (Ctrl+Atl+LeftButton or Ctrl + Alt + B)
- 掌握调试方法    —— 快捷键 F7, F8, F9

### `maven` 下载安装
- [apache-maven-3.6.3](https://dlcdn.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip)
>
> `maven`命令行检查是否安装成功
```shell
echo $M2_HOME
mvn  --version
mvn clean install package deploy
```

#### `maven`私域仓库`archiva`开发环境配置
maven setting 文件（用于配置 apache archive 私服授权）, 通常保存在 ~/.m2 目录下, 或系统环境变量定义的$M2_HOME目录下。
- [settings.xml](http://120.79.49.72:8000/devops/settings.xml) 下载


#### `maven` 开发理解
- 理解` mvn install` 的作用，与 `mvn deploy` 的区别
- 理解 `mvn package` 生成的 `-standalone.jar` 与非 `standalone.jar` 的区别
- 掌握 `pom.xml` 里定义变量的使用，掌握在命令行下通过设置变量，不生成 `-standalone.jar` 的方法
- 掌握避免 `deploy standalone.jar` 的方法
- 掌握依赖关系的查看方法 `mvn dependency:tree`

要看当前 `package` 的所有依赖，可以通过 `| grep keyword`  过滤

```java 
$ mvn clean package install deploy
$ mvn dependency:tree
# -Dverbose参数查看到所有的传递依赖  -Dincludes或者-Dexcludes 过滤指定的依赖，包含或不包含
$ mvn dependency:tree -Dverbose -Dincludes=com.jfeat:jwt-core
$ mvn dependency:tree | cat -n | grep “org.json”
```

#### `maven`常见问题
>
下载 ***maven 3.6.3*** (最新版本3.6.3与java 11 不兼容), 设置环境变量M2_HOME, 增加路径置设 PATH=%M2_HOME%\bin, 
不兼容的情况下，测过junit单元测试可能会出现以下错误
```java
Failed to execute goal org.apache.maven.plugins:maven-surefire-plugin:2.18.1:test (default-test) on project
```
>
> 在 `pom.xml` 中增加插件
```
<plugins>
  <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-surefire-plugin</artifactId>
      <version>2.19.1</version>
      <configuration>
          <skipTests>true</skipTests> 
          <!-- <skipAfterFailureCount>1</skipAfterFailureCount> -->
          <!-- <forkCount>1</forkCount> -->
          <!-- <reuseForks>true</reuseForks> -->
      </configuration>
  </plugin>
</plugins>
```
### nodejs LTS 下载安装
用于前端开发
-[nodejs官网](https://nodejs.org/en/) 下载最新 **LTS** 版本
使node, npm 可执行

#### 设置淘宝镜像
由于国内网络环境原因，执行`npm install`前
```shell
$ npm config set registry https://registry.npm.taobao.org
$ npm i
```

## 尝试运行第一个`springboot`项目

- 克隆代码 
```
git clone https://github.com/zhaosair/env-test-saas
```

- 通过`maven`构建
```shell
cd env-test-saas
mvn clean package
```

- 运行`java`包
可以通过`intellij idea`直接运行, 也可以通过命令行运行
```
## 出现以下提示，表示运行成功
Test SaaS is success!
```

- 运行成功后可，在浏览器地址栏查看`swagger`文档
```shell
http://127.0.0.1:8080/swagger-ui.html
```

## 开发与调试

### `http client` 测试工具
- vscode restclient 插件【推荐】
- Postman

### 安装常用开发工具
> 首先掌握 `standalone` 的使用
```shell
$ git clone --depth=1 https://gitee.com/smallsaas/dev-cli.git
$ cd dev-cli
$ npm i
$ npm link
```

### 理解并掌握JAVA配置文件
```yaml
## cat src/main/resources/application.yml

# 指定运行端口
server:
   port: 8080
   
# 指定应用配置方案
spring:
   profiles:
      active: dev

---
## dev profile sample
spring:
  profiles: dev
  datasource:
      url: jdbc:mysql://127.0.0.1/test?useSSL=false&autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull
      username: root
      password: root
      filters: log4j,wall,mergeStat
      sql-script-encoding: UTF-8
      schema: classpath*:sql/**/*-schema.sql
      data: classpath*:sql/**/*-data.sql
      initialize: false
      # initialize=true 代表应用的所有依赖模块的数据表被重置（重新建表，数据丢失）
logging:
  level: debug
```

- 掌握在命令下运行 `standalone.jar` , 并能指定参数运行
```shell
$ ## 运行时指定端口，以及配置方案名称 dev
$ java -jar target/app-standalone.jar --server.port=8080  --spring.profiles.active=dev
```

### 数据库表插入数据存在外键依赖
在 `.sql` 文件中第一行增加以下设置
```sql
SET FOREIGN_KEY_CHECKS = 0;
```

### 虚拟机安装与使用
- 选用 VMware 或 VirtualBox 工具安装Linux操作系统
- 掌握虚拟机的 **端口转发** 原理及其配置

### 理解 linux平台命令的参数意义
```shell
$ curl --help
Usage: curl [options...] <url>
# <>   代表 <必填> 参数
# []   代表 [选填] 参数
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

### 匹配的常见用例
> sed 匹配与标准正式表达式略有不同
> * 不支持 \d, 用[0-9]代替
> * 不支持 +, 用 \* 代替, 如  [0-9]\*
> * 不支持 \s, 用 [[:space:]] 代替
> * ( 直接匹配 ( 符号；\\( 以及 \\) 才是转义字符，用于匹配提取

#### POSIX Character Classes. [:class:]
```
This is an alternate method of specifying a range of characters to match.
[:alnum:] matches alphabetic or numeric characters. This is equivalent to A-Za-z0-9.
[:alpha:] matches alphabetic characters. This is equivalent to A-Za-z.
[:blank:] matches a space or a tab.
[:cntrl:] matches control characters.
[:digit:] matches (decimal) digits. This is equivalent to 0-9.
[:graph:] (graphic printable characters). Matches characters in the range of ASCII 33 - 126. This is the same as [:print:], below, but excluding the space character.
[:lower:] matches lowercase alphabetic characters. This is equivalent to a-z.
[:print:] (printable characters). Matches characters in the range of ASCII 32 - 126. This is the same as [:graph:], above, but adding the space character.
[:space:] matches whitespace characters (space and horizontal tab).
[:upper:] matches uppercase alphabetic characters. This is equivalent to A-Z.
[:xdigit:] matches hexadecimal digits. This is equivalent to 0-9A-Fa-f.
```

- 匹配空格多个空格
```shell
$ echo "This is new    line" | sed "s/new[[:space:]]*line/newline/"
This is newline
```
- 匹配并同时替换文件内容
```shell
$ cat newline.txt
This is new    line
$ sed -i "s/new[[:space:]]*line/newline/" newline.txt
$ cat newline.txt
This is newline
```

- 删除回车 (dos2unix)
```shell
$ sed -i 's/\r//g' newline.txt
```

- 匹配提取为替换的变量
> \1为匹配提取的第一个变量
```shell
$ echo "\`wms_storage_out_item\` VALUES (445" | sed "s/\`wms_storage_out_item\`[[:space:]]*VALUES[[:space:]]*(\([0-9]*\)/newline: \1/"
newline: 445
```

### 如何登录远程服务器
在 **Innovation Oriented** 群文件搜索 **“PuTTY自动登录SSH服务器”** 文档，了解**ssh**概念
1)   学习使用 [putty](http://putty.cs.utah.edu/), 或其他 ssh 登录工具
2)   学习 scp 或 WinScp (Windows平台可视化scp,可下载安装) 的使用
3)   掌握 ssh-keygen 的 以及 id_rsa.pub  key 的使用

### ssh无密码登陆
[Passwordless SSH access](https://www.raspberrypi.org/documentation/remote-access/ssh/passwordless.md)
> 向目标主机分发本机密匙
```
ssh-copy-id root@192.168.3.239
# or -> ssh-copy-id -i ~/.ssh/id_rsa.pub root@192.168.3.239
```

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


## `Git`的使用
- 在 Innovation Oriented 群文件搜索 **“git常用命令”** 文档，学习git的使用。
- 提交代码时过滤掉临时文件或其他不应该提交的文件
  ```shell
  $ cat .gitignore 
  target/
  build/
  .idea/
  .svn/
  logs/
  LOG**
  ```
  
### 学习提交`Github`代码 `PR`
[pull-request](https://gitbook.tw/chapters/github/pull-request)

### GIT使用笔记
[朱翰韬`git`使用笔记](https://note.youdao.com/s/9i8X0zPF)

### 使用 PR (Pull Request) 提交代码
[pull-request](https://gitbook.tw/chapters/github/pull-request)
 

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
- * 代码级别多抛常`Exception` 或 `RuntimeException`出防止参数错误或逻辑性错误
- 尽量多写log，标记重要代码段信息输出, 以免 **消息日志不够完整，遇到问题难定位**

### 防范空指针

* 禁止连续使用点(.)操作以避免空针错误，多点操作改为分多段代码并加非空判断
* 尽量多判断输入参数或返回对象是否为null, 如果输入参数或返回对象不能为空，则抛出异常(throw new RuntimeException())；
* 禁止使用多点操作，因为多点操作很容易出现空针指；对多点操作应分开多行获取对象，并对获取的对象进行非空判断

## 开发常见问题

### 项目无法启动问题
- pom 配置参考 env-test-saas 项目的pom文件，并重新启动。
- 如参考env-test-saas pom 项目仍旧无法正常启动，收集该问题的解决方法，并更新此文档，入需要额外的依赖，请同时操作 env-test-saas pom的更新

### 开发过程中某张表需要新添加字段的问题
- 首先在 *-schema.sql 文件里找到对应的表进行字段更新
- 其次 修改 gen/persistence/ 目录下找到对应的 类/xml 文件更新对应的实体
- 最后 更新 domain/dao/ 目录下对应的 xml (如 Base_Column_List内容为 table.* 则无需修改该 Base_Column_List)，主要修改的内容为 resultMap

### 404 问题
- 确定 ip:port 正确的情况下，如出现到api404.检查Endpoint层是否使用了事务处理注解
```java
    @Transactional
```

### 学习容器Docker技术
- [Docker-从入门到精通](https://yeasy.gitbook.io/docker_practice/)


## 实用工具 

- https://u.tools/
- https://typora.io/

> * Typora编辑器：https://typora.io/
> * Typora主题库：http://theme.typora.io/
> * Typora文档：http://theme.typora.io/doc/
> * Typora使用：https://sspai.com/post/54912
> * emoji图标：https://www.cnblogs.com/wangjs-jacky/p/12011208.html

