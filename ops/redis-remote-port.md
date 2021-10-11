## open-redis-port-for-remote-connections
> https://stackoverflow.com/questions/19091087/open-redis-port-for-remote-connections

1. Open the file at location 
```
cat /etc/redis/redis.conf
# comment out below line
# bind 127.0.0.1 ::1  
# protected-mode yes
protected-mode no
```

2. Restart Redis:
```
  sudo systemctl start redis.service
```
 
### Optional
3. Disable Firewalld:
```
  systemctl disable firewalld
```
4. Stop Firewalld:
```
  systemctl stop firewalld
```
