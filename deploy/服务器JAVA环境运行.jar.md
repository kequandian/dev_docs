## 服务器`java 11`环境下运行`springboot app.jar`

### 服务器文件结构
```
.
├── app.jar
└── config
│   └── application-dev.yml
```

#### 终端运行（日志直接输出到`stdout`)
```
java -jar app.jar --spring.profiles.active=dev --server.port=8080
```

#### `application-dev.yml`
> cat application-dev.yml
```YAML
---
spring:
  profiles: dev
  datasource:
    url: jdbc:mysql://mysqlserver:3306/test?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true
    username: root
    password: root
    driver-class-name: com.mysql.cj.jdbc.Driver
    filters: log4j,mergeStat
    sql-script-encoding: UTF-8
    schema: classpath*:sql/*-schema.sql
    data: classpath*:sql/*-data.sql
    initialize: true

logging:
  level: debug
```
