## 一健安装Docker
> 仅适合`centos`
```
curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/scripts/centos-script -o centos-script && \ 
sh centos-script --install-docker
```
#### 开机启动docker
```
systemctl enable docker
```


## 如何解决 github.com 无法显示图片问题
[dns](http://tool.chinaz.com/dns?type=1&host=github.com) 查询有效IP，然后设置至`hosts`
>
```sh
## github.com
$ cat /etc/hosts  # cat /c/Windows/System32/drivers/etc/hosts for windows
140.82.114.4 gist.github.com
185.199.108.153 assets-cdn.github.com
151.101.64.133 raw.githubusercontent.com
151.101.108.133 gist.githubusercontent.com
151.101.108.133 cloud.githubusercontent.com
151.101.108.133 camo.githubusercontent.com
151.101.108.133 avatars0.githubusercontent.com
151.101.108.133 avatars1.githubusercontent.com
151.101.108.133 avatars2.githubusercontent.com
151.101.108.133 avatars3.githubusercontent.com
151.101.108.133 avatars4.githubusercontent.com
151.101.108.133 avatars5.githubusercontent.com
151.101.108.133 avatars6.githubusercontent.com
151.101.108.133 avatars7.githubusercontent.com
151.101.108.133 avatars8.githubusercontent.com
```

## 典型前端组件化开发参考
[openbase.io](https://openbase.io)

## 文档标准
[tailwind-react-ui/#radio](https://emortlock.github.io/tailwind-react-ui/)


## 开源流程与工作流
- https://gitee.com/opencc/JFlow
- https://gitee.com/thinkgem/jeesite4-jflow
- 
