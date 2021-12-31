### `/etc/localtime`
```
rm -f /etc/localtime 
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
```

### `/etc/timezone`
```
echo 'Asia/Shanghai' > /etc/timezone
```
