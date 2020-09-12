## MySQL支持emoji表情集使用 utf8mb4

### 配置
> 解决问题: emoji图标存储乱码等

```shell
$ cat /etc/mysql/conf.d/my.cnf
[client]
default-character-set=utf8mb4

[mysqld]
character-set-client-handshake = FALSE
character-set-server = utf8mb4
collation-server = utf8mb4_unicode_ci
init_connect=’SET NAMES utf8mb4'

[mysql]
default-character-set=utf8mb4

```

### 建表语句
```
create database test_db character set = utf8mb4 collate = utf8mb4_unicode_ci;

CREATE TABLE `t_test` (
  `id` bigint(20) DEFAULT NULL,
  `status` varchar(26)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

### JDBC连接 
> 不要使用 characterEncoding=utf8
```
jdbc:mysql://HOST/dbname?autoReconnect=true&useUnicode=true&zeroDateTimeBehavior=convertToNull
```

> 注：对于非选用uft8mb4字符集的数据库，连接字符串必须使用characterEncoding=utf8,否现，无法支持中文

