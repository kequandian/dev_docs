## nginx 配置技巧

#### 解决跨域问题
> 需要配置 OPTIONS,否则不生效
```
if ($request_method = 'OPTIONS') {
    return 204;
}
```

```
server {
    listen 80;
    server_name localhost;

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
```

#### 转发TCP端口
```
# cat nginx.conf
stream {
    upstream mysql_port {
        server mysql:3306;
    }

    server {
        listen 23306;
        proxy_pass mysql_port;
    }
}
http {}

## or
stream {
    server {
        listen 23306;
        proxy_pass mysql:3306;
    }
}

```

#### 不替换路径 (仅替换域名)
> 访问域名 http://domain.com/api/add 转发至 http://app-api:8080/api/add
```
location /api/add {
   proxy_pass http://app-api:8080;
} 
```

#### 替换路径
> 如果请求的url是 http://domain.com/beijing/index-ui.html 转发至 http://app-api:8080/index-ui.html
```
location ^~ /beijing/ {
   proxy_pass http://app-api:8080/;
}
```
