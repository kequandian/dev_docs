```
npm config set registry https://registry.npm.taobao.org
npm install --force
```

cat /etc/hosts
> cat /c/windows/System32/drivers/etc/hosts
```
# Github
140.82.113.4 github.com
140.82.113.4 www.github.com
140.82.113.4 codeload.github.com
199.232.69.194 github.global.ssl.fastly.net
185.199.108.153 assets-cdn.github.com
185.199.109.153 assets-cdn.github.com
185.199.110.153 assets-cdn.github.com
185.199.111.153 assets-cdn.github.com
```

git 
```
RUN ssh-keyscan -p 7207 git.f.smallsaas.cn >> ~/.ssh/known_hosts
WORKDIR /usr
RUN git clone ssh://pi@git.f.smallsaas.cn:7207/repo/git/gmic/gmic-cad-artifact.git --single-branch -b master src
```
