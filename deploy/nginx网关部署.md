## 网关配置
网关包括:
- 前端页面发布包`dist`
- 服务路由转发

#### 服务器端目录结构
> 配置规范: 直接用域名用为配置文件名 
 ```
 .
├── cert
│   ├── api.cloud.domainname.cn.key
│   └── api.cloud.domainname.cn.pem
├── conf.d
│   ├── api.cloud.domainname.cn.conf
│   └── default.conf
├── dist
│   ├── static
│   └── index.html
├── logs
│   ├── access.log
│   └── error.log
├── config.js
├── docker-compose.yml
└── nginx.conf
 ```
 
 #### 路由配置
 详细转发配置
 ```
 server {
    server_name localhost;
    listen 80;
    listen 443 ssl;
    server_name api.cloud.domainname.cn;
    ssl_certificate  /cert/api.cloud.domainname.cn.pem;   #证书文件地址
    ssl_certificate_key /cert/api.cloud.domainname.cn.key; #证书文件地址
    ssl_session_timeout 5m;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;
    ssl_prefer_server_ciphers on;

    root html;
    index index.html index.htm;
    location /images {
        root /;
        index index.html;
    }
    location /attachments {
        root /;
        index index.html;
    }
    location / {
        root /;
        index index.html;
        try_files $uri /index.html  ## How to work around the 404 error on nginx?
    }

    location /api {
        proxy_hide_header access-control-allow-origin;
        add_header Access-Control-Allow-Origin *;
        add_header Access-Control-Allow-Methods 'GET, POST, PUT, DELETE, OPTIONS';
        add_header Access-Control-Allow-Headers 'Authorization,Content-Type,Accept,Origin,DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-CustomHeader,X-Requested-With,If-Modified-Since,Cache-Control,Content-Range,Range';
        if ($request_method = 'OPTIONS') {
            return 204;
        }
        proxy_pass http://api:8080;
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
    location /rpc {
        proxy_pass http://api:8080;
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
 
 
#### `config.js`
> $ cat config.js
```
if (window.ZEle === undefined) {
  window.ZEle = {};
}
window.ZEle.endpoint = "";
window.ZEle.nav = "left"; //OPTIONS: LeftNavCollaps, left, top, both
window.ZEle.indexPage = "";
window.ZEle.breadcrumb = true;

window.ZEle.remoteConfig = {};
```
 
##### `default.conf`
> $cat conf.d/default.conf
```
    gzip  on;
    gzip_min_length 1k;
    gzip_buffers 4 16k;
    gzip_comp_level 2;
    gzip_types text/plain application/javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png;
    gzip_vary on;
```

##### `docker-compose.yml`配置
```
version: "3.4"
services:
  nginx:
    image: 'daocloud.io/library/nginx:latest'
    ports:
      - 80:80
      - 443:443
    volumes:
      # - ./nginx.conf:/etc/nginx/nginx.conf
      - ./conf.d:/etc/nginx/conf.d
      - ./logs:/var/log/nginx
      - ./cert:/cert
      - ./images:/usr/share/nginx/html/images
      - ./attachments:/usr/share/nginx/html/attachments
      - ./dist:/usr/share/nginx/html
      - ./config.js:/usr/share/nginx/html/config.js
    logging:
      driver: "json-file"
      options:
        max-size: "5k"
    environment:
      TZ: "Asia/Shanghai"
    restart: always
    networks:
     - biliya_default
```

##### `nginx.conf`
> cat nginx.conf
```
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;

    client_max_body_size 20m;
}


#stream {
#    server {
#        listen 23306;
#        proxy_pass mysqlserver:3306;
#    }
#}
```

