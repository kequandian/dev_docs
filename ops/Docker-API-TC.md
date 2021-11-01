### Extract an archive of files or folders to a directory in a container

> https://docs.docker.com/engine/api/v1.41/#operation/ContainerArchive
> 

```
curl -i -X PUT http://localhost:2375/containers/biliya-api/archive?path=/tmp -H "Content-Type: application/x-tar" --data-binary @cg-core-1.0.0.jar.ta
```
