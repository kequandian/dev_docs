## 快速部署`lib.jar`
独立部署`.jar`库, 

> 基于`portainer`的`stack`上传 `docker-compose.yml`以及库`.jar`文件完成部署

```YAML
version: "3.4"
services:
  api:
    image: zelejs/api:dummy
    #image: 192.168.3.239:5000/api:dummy
    privileged: true
    restart: always
    working_dir: /webapps
    environment: 
      #GREENFIELD: dummy
      #JAVA_OPTS: "$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
      URL_SHORT: 127.0.0.1:3306/dummy
      USERNAME: root
      PASSWORD: root
      ROLLBACK_KEEP_NUM: 2
    volumes: 
      - /etc/localtime:/etc/localtime:ro
      - ./:/webapps
      - ./lib:/webapps/lib
    logging:
      driver: "json-file"
      options:
        max-size: "5m"
    ports: 
      - 8080:8080
```


## 快速部署数据依赖的`-standalone.jar`包

#### 构建`.jar`
在本地通过`mvn clean package` 构建 `.jar`包

#### 登录服务器创建目录
> 上传`.jar`文件至`api/app.jar`
```
├── api
│   └── app.jar
├── config
│   └── application-dev.yml
└── docker-compose.yml
```

#### 修改`docker-compose.yml`变更网络
> my-net 是通过查看容器网络获取的名称
> 变更`servicename`为服务名称
查看容器网络
```shell
docker inspect <container>
```
>
```YAML
version: "3.4"
services:
  servicename:
    image: adoptopenjdk:11-jre-hotspot
    privileged: true
    restart: always
    working_dir: /webapps
    volumes: 
      - /etc/localtime:/etc/localtime:ro
      - ./api:/webapps
      - ./attachments:/webapps/attachments
      - ./config/application-dev.yml:/webapps/config/application-dev.yml
    extra_hosts: 
      - "mysqlserver:192.168.3.239"
    # ports: 
    #   - 8080:8080
    logging:
      driver: "json-file"
      options:
        max-size: "5m"
    command:
      - /bin/sh
      - -c
      - |
        java -jar *.jar --sprint.profiles.active=dev --server.port=8080
    networks: 
      - target_network
      # - mysqlserver_default

networks: 
  target_network:
    external: true
  # mysqlserver_default:
  #   external: true
```

#### 配置数据库
> 配置连接数据库的`host`以及`database`
```YAML
---
spring:
  profiles: dev
  datasource:
      url: jdbc:mysql://mysqlserver:3306/test?useSSL=false&autoReconnect=true&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true
      username: root
      password: root
      driver-class-name: com.mysql.cj.jdbc.Driver
      filters: log4j,wall,mergeStat
      sql-script-encoding: UTF-8
      schema: classpath*:sql/*-schema.sql
      data: classpath*:sql/*-data.sql
      initialize: false 

logging:
  level: debug
  file: logs/access.log
```


#### 配置目标服务网关
配置 `conf.d/*.conf` 进行服务转发
```
server {
    listen 80;
    server_name localhost;

    location / {
        root html;
        index index.html index.htm;
        try_files $uri /index.html;
    }

    location /api/server/services {
        proxy_hide_header access-control-allow-origin;
        add_header Access-Control-Allow-Origin *;
        add_header Access-Control-Allow-Methods 'GET, POST, PUT, DELETE, OPTIONS';
        add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization';
        if ($request_method = 'OPTIONS') {
            return 204;
        }

        proxy_pass http://servername:8080;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto  $scheme;
        proxy_buffering off;
        proxy_max_temp_file_size 0;
        proxy_connect_timeout 30;
        proxy_cache_valid 200 302 10m;
        proxy_cache_valid 301 1h;
        proxy_cache_valid any 1m;
    }
}
```

