## nginx 配置技巧

#### 解决跨域问题
```
server {
    listen 80;
    server_name localhost;

    location /wap {
       add_header 'Access-Control-Allow-Origin' '*';
       add_header 'Access-Control-Allow_Credentials' 'true';
       add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
       add_header 'Access-Control-Allow-Methods' 'GET,POST,PUT,DELETE,PATCH';

       proxy_pass http://api:8080;
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
