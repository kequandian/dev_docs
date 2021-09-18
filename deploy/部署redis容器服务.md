## 部署 redis 容器服务
在服务器创建部署目录
```
redis
├── conf
│   └── redis.conf
└── redis.yml
```

#### 配置
```shell
$ cat conf/redis.conf
notify-keyspace-events "Ex"
```

- `redis.yml`配置 (等价`docker-compose.yml`)

> 替换网络`target_network`为目标容器网络
> 
> 或 直接使用主机网络`network_mode: host`
>
```YAML
version: "3.4"
services:
  redis:
    image: 'daocloud.io/library/redis:3.2.9'
    container_name: redis
    privileged: true
    restart: always
    environment:
      TZ: "Asia/Shanghai"
    volumes:
      - ./conf:/usr/local/etc/redis
    logging:
      driver: "json-file"
      options:
        max-size: "2m"      
    command:
      - redis-server
      - /usr/local/etc/redis/redis.conf
    #ports:
    #  - 127.0.0.1:6379:6379
    # network_mode: host
    networks:
      - target_network
      
networks: 
  target_network:
    external: true      
```

#### 启动服务
```
docker-compose -f redis.yml up -d 
```

