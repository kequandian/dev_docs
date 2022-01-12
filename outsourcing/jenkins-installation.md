https://www.jenkins.io/doc/book/installing/linux/

### Long Term Support release
```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

sudo systemctl start jenkins
sudo systemctl status jenkins
```

### install openjdk-11-jdk
```
sudo apt install openjdk-11-jdk
```

### docker installation
```
docker network create jenkins
docker volume create jenkins_home
docker run -d --name jenkins --privileged --network jenkins -p 8081:8080 -v /etc/localtime:/etc/localtime:ro -v /etc/timezone:/etc/timezone:ro -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```
