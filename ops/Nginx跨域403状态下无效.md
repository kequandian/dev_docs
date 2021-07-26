## Nginx 跨域 add_header 403状态下无效
```
add_header 'Access-Control-Allow-Origin' '*';
add_header 'Access-Control-Max-Age' '1000';
add_header 'Access-Control-Allow-Methods' "POST, GET, OPTIONS, DELETE, PUT";
add_header 'Access-Control-Allow-Headers' "x-requested-with, Content-Type, origin, authorization, accept, client-security-token";   
```

#### Solution
```
add_header 'Access-Control-Allow-Origin' '*' always;
add_header 'Access-Control-Max-Age' '1000' always;
add_header 'Access-Control-Allow-Methods' "POST, GET, OPTIONS, DELETE, PUT" always;
add_header 'Access-Control-Allow-Headers' "x-requested-with, Content-Type, origin, authorization, accept, client-security-token" always;  
```
