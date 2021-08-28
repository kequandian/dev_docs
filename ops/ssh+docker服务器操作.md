## Use Your local SSH Keys Inside a Docker Container
https://medium.com/trabe/use-your-local-ssh-keys-inside-a-docker-container-ea1d117515dc

### create a key and exchange it with the target server:
```shell
$ ssh-keygen -t rsa -b 4096 -f ./id_rsa_shared
$ ssh-copy-id -i ./id_rsa_shared remoteuser@remotehost
```

```Dockerfile
FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-client
RUN useradd -m user
RUN mkdir -p /home/user/.ssh
COPY id_rsa_shared /home/user/.ssh/id_rsa
RUN chown -R user:user /home/user/.ssh
RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/user/.ssh/config
USER user
CMD ["/bin/bash"]
```
