## open-redis-port-for-remote-connections
> https://stackoverflow.com/questions/19091087/open-redis-port-for-remote-connections

1. Open the file at location /etc/redis.conf

2. Comment out bind 127.0.0.1

3. Restart Redis:

```
  sudo systemctl start redis.service
```
  
4. Disable Firewalld:
```
  systemctl disable firewalld
```
5. Stop Firewalld:
```
  systemctl stop firewalld
```
