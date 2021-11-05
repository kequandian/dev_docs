## 解决`SSL_connect`问题
github mirror: `ec2-52-74-223-119.ap-southeast-1.compute.amazonaws.com`
```shell
git remote -v
git@ec2-52-74-223-119.ap-southeast-1.compute.amazonaws.com:kequandian/demo.smallsaas.cn.git
```


`LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443`
- https://stackoverflow.com/questions/48987512/ssl-connect-ssl-error-syscall-in-connection-to-github-com443

```shell
# git config --global --add remote.origin.proxy "127.0.0.1:1080"
export https_proxy=https://127.0.0.1:1080/pac?auth=TzRZDAUZxJ9Y98fKEyM5&t=202006201446199491 \
       http_proxy=http://127.0.0.1:1080/pac?auth=TzRZDAUZxJ9Y98fKEyM5&t=202006201446199491 \
       all_proxy=socks5://127.0.0.1:1087
```

## 最佳实践
- [OpenResty 最佳实践](https://moonbingbing.gitbooks.io/openresty-best-practices)

## 元宇宙
- [dmarket](https://dmarket.com/)

## 典型前端组件化开发参考
- [openbase.io](https://openbase.io)
- [dribble: world class design](https://dribbble.com)
- [tailwind-react-ui](https://emortlock.github.io/tailwind-react-ui/)
- [报表](https://holo.poi.cat/youtube-channel)

## 开源流程与工作流
- https://gitee.com/opencc/JFlow
- https://gitee.com/thinkgem/jeesite4-jflow
- 
