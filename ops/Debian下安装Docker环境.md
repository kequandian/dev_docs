## Install Docker Engine on Debian
https://docs.docker.com/engine/install/debian/

#### Uninstall old versions
```
apt-get remove docker docker-engine docker.io containerd runc
```

#### Set up the repository
```
apt-get update
apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
```

#### Add Docker’s official GPG key
```
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

#### Use the following command to set up the stable repository
```
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Install Docker Engine
```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

#### Install from a package
- https://download.docker.com/linux/debian/dists/
>  choose your Debian version, then browse to pool/stable/, choose amd64, armhf, or arm64, and download the .deb file for the Docker Engine version you want to install.
> > https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/

```
sudo dpkg -i /path/to/package.deb
```

## Install docker-compose
https://github.com/docker/compose/releases
```
curl -L https://get.daocloud.io/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

