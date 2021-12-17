upstream mysql_port {
    server mysqlserver:3306;
}

server {
    listen 23306;
    proxy_pass mysql_port;
}
