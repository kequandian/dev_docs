## nginx 配置技巧

### 配置上传文件大小
```shell
server {
   listen  80;
   server_name localhost
   client_max_body_size 10m;
}
```

### 解决跨域问题
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

### 转发TCP端口
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

### 不替换路径 (仅替换域名)
> 访问域名 http://domain.com/api/add 转发至 http://app-api:8080/api/add
```
location /api/add {
   proxy_pass http://app-api:8080;
} 
```

### 替换路径
> 如果请求的url是 http://domain.com/beijing/index-ui.html 转发至 http://app-api:8080/index-ui.html
```
location ^~ /beijing/ {
   proxy_pass http://app-api:8080/;
}
```

### 当前域名的请求转到新域名
```
server{
   rewrite ^/(.*) http://www.smallsaas.cn/$1 permanent;
}
```

### 转发请求

- 首先切换至Nginx安装路径下，编辑`nginx.conf`文件
- 随后在`http`结构块中加入`include /etc/nginx/conf.d/*.conf;`表示引入`conf.d`下的所有`*.conf`文件内容作为配置
- 随后在`nginx`目录下新建`conf.d`目录
- 在`conf.d`目录下新建服务点配置文件，如新建`docs.conf`
- 写入以下内容作为请求转发配置

```shell
server {
    # 监听端口号
    listen 80;
    # 监听域名
    server_name 域名;

	# 转发路径
    location / {
            # 转发目的地
            proxy_pass http://127.0.0.1:8003/;
            # 设置请求头
            proxy_set_header Host $http_host;
            # 设置请求IP
            proxy_set_header X-Real-IP $remote_addr;
            # 设置转发目标
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            # 设置转发源
            proxy_set_header X-Forwarded-Proto  $scheme;
            # 设置是否开启缓存
            proxy_buffering off;
            # 设置临时文件最大大小
            proxy_max_temp_file_size 0;
            # 设置代理连接超时时间
            proxy_connect_timeout 30;
            # 设置状态码200的请求对应缓存时间
            proxy_cache_valid 200 302 10m;
            # 设置状态码301的请求对应缓存时间
            proxy_cache_valid 301 1h;
            # 设置其余状态码的请求对应缓存时间
            proxy_cache_valid any 1m;
    }
}
```

- 随后可通过以下命令刷新Nginx配置信息

```shell
# nginx -t表示预先进行配置文件的测试
$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful

# 表示重新载入配置文件
$ sudo nginx -s reload
```

- 至此，请求转发配置完成

### 静态部署刷新出现404问题

> 相关链接:https://stackoverflow.com/questions/47077428/how-to-work-around-the-404-error-on-nginx

- 尝试在`location`中添加`try_files $uri /index.html;`配置，随后重新加载配置
```
location / {
        root /;
        index index.html index.htm;
        try_files $uri /index.html
   }
```
