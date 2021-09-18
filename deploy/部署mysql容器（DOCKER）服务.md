## 部署 mysql 容器服务
在服务器创建部署目录
```
mysqlserver
├── mysqlserver.yml
└── mysql
    ├── data
    ├── logs
    ├── initdb.d
    │   └── init-data.sql
    └── mysql.conf.d
        ├── sql_mode.cnf
        └── utf_8.cnf
```

#### 配置

- `sql_mode.cnf`
```shell
$ cat mysql/mysql.conf.d/sql_mode.cnf
[mysqld]
sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'
```

- `utf_8.cnf`
```shell
$ cat mysql/mysql.conf.d/utf_8.cnf
[mysqld]
character_set_server=utf8
init_connect='SET NAMES utf8'

[mysql]
default-character-set = utf8

[mysql.server]
default-character-set = utf8

[mysqld_safe]
default-character-set = utf8

[client]
default-character-set = utf8
```

### `docker-compose.yml`
数据库安全要求比较高，尽量不暴露端口，或不使用端口号`3306`
```YAML
version: "3.4"
services:
  mysql:
    image: 'daocloud.io/library/mysql:5.7'
    container_name: mysqlserver
    privileged: true
    restart: always
    logging:
      driver: "json-file"
      options:
        max-size: "5m"      
    volumes:
       - ./mysql/mysql.conf.d/sql_mode.cnf:/etc/mysql/mysql.conf.d/sql_mode.cnf
       - ./mysql/mysql.conf.d/utf_8.cnf:/etc/mysql/mysql.conf.d/utf_8.cnf
       - ./mysql/data:/var/lib/mysql
       - ./mysql/logs:/var/log/mysql
       #- ./mysql/initdb.d/init-data.sql:/docker-entrypoint-initdb.d/init-data.sql
    environment:
       LANG: "C.UTF-8"
       TZ: "Asia/Shanghai"
       MYSQL_DATABASE: test
       MYSQL_ROOT_PASSWORD: root
    #ports:
    #   - 13323:3306
    networks:
      - mysqlserver
      
networks: 
  mysqlserver:
    external: false      
```

#### 启动服务
```
docker-compose -f mysqlserver.yml up -d 
```

