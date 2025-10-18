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

## UI 市场
- [Dashboard market](https://other-levels.com/)

## 典型前端组件化开发参考
- [openbase.io](https://openbase.io)
- [dribble: world class design](https://dribbble.com)
- [tailwind-react-ui](https://emortlock.github.io/tailwind-react-ui/)
- [报表](https://holo.poi.cat/youtube-channel)
- [new报表](https://vt.poi.cat/channel/subscribers)
- [Excel报表](https://www.other-levels.com/)

## 开源流程与工作流
- https://gitee.com/opencc/JFlow
- https://gitee.com/thinkgem/jeesite4-jflow

## reweb 
https://www.reweb.so/

## svg icons
https://icons.getbootstrap.com/

## ai logo
https://www.logosc.cn/

## p5.js (openframework)
https://p5js.org/ 

## bit
https://bit.dev/

## mockjs
http://mockjs.com/examples.html


## Writing a loader
https://webpack.js.org/contribute/writing-a-loader/


## code sandbox
https://codesandbox.io/


## Material-ui
https://material-ui.com/zh/


## Markdown Docs
- https://ahooks.js.org/zh-CN/docs/api/
- [useRequest](https://ahooks.js.org/zh-CN/hooks/async/)


## vscode 在线编辑
https://stackblitz.com/edit/vscode-yz1ejl?file=index.html

## 在线代码
https://www.showmebug.com/


## 物理库
https://magnum.graphics/

## SSO Authing
> 界与流程参考
https://authing.co/

## Babylonjs WebGL
https://www.babylonjs.com/


## EditorX vs AutoX LayoutX
https://editorx.com

## Konvajs 基于canvas的图形编辑库
https://konvajs.org/

## react-drag-drop-layout
https://codesandbox.io/s/github/chriskitson/react-drag-drop-layout-builder

