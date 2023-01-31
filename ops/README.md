#### 向日葵
https://sunlogin.oray.com/download/

#### 安装容器环境脚本 
```shell
curl -sSL http://acs-public-mirror.oss-cn-hangzhou.aliyuncs.com/docker-engine/internet | sh -
curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
systemctl enable docker
systemctl start docker
```

#### 安装arm版本
> https://www.louishe.com/2021/12/13/doc-11418.html
```shell
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install curl python3-pip libffi-dev python-openssl libssl-dev zlib1g-dev gcc g++ make -y
curl -sSL https://get.docker.com/ | sh
sudo snap install rustup --classic
sudo apt install rustc
sudo -H pip3 install --upgrade pip
sudo pip3 install docker-compose
sudo docker-compose --version
```
