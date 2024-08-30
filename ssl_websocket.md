### 生成密钥
openssl genrsa -out ca.key 2048

### 生成证书请求
openssl req -new -key ca.key -out ca.csr 

### 生成证书
openssl x509 -req -days 3650 -in ca.csr -signkey ca.key -out ca.pem

### 查询证书信息
openssl x509 -in ca.pem -text -noout


### ssl 配置
```
listen 443 ssl;
server_name localhost;

ssl_certificate /etc/ssl/certs/ca.pem;
ssl_certificate_key /etc/certs/ca.key;
```

### upgrade websocket
```
proxy_set_header X-Forwarded-Host $host;
proxy_set_header X-Forwarded-Server $host;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

location / {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_pass http://whiteboard-room;
}
```
