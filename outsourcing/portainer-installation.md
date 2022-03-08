https://docs.portainer.io/v/ce-2.9/start/install/server/docker/linux

```shell
docker network create portainer
docker volume create portainer_data
docker run -d -p 9000:9000 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:2.9.3
```
