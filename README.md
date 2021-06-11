## 解决`SSL_connect`问题
`LibreSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443`
- https://stackoverflow.com/questions/48987512/ssl-connect-ssl-error-syscall-in-connection-to-github-com443

```shell
# git config --global --add remote.origin.proxy "127.0.0.1:1080"
export https_proxy=http://127.0.0.1:1087 http_proxy=http://127.0.0.1:1087 all_proxy=socks5://127.0.0.1:1087
```

## 最佳实践
- [OpenResty 最佳实践](https://moonbingbing.gitbooks.io/openresty-best-practices)


## 典型前端组件化开发参考
- [openbase.io](https://openbase.io)
- [dribble: world class design](https://dribbble.com)
- [tailwind-react-ui](https://emortlock.github.io/tailwind-react-ui/)


## 开源流程与工作流
- https://gitee.com/opencc/JFlow
- https://gitee.com/thinkgem/jeesite4-jflow
- 
