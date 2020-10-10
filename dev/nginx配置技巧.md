## nginx 配置技巧

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
