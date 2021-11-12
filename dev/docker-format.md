### get network containers
```
get_network_containers() {
   network=$1
   docker network inspect $network  --format '{{range .Containers}}{{$name := .Name}}{{println $name}}{{end}}'
}
```

### get container volumes
```json
 "Mounts": [
            {
                "Type": "bind",
                "Source": "/home/smartsee/mysql/data",
                "Destination": "/var/lib/mysql",
                "Mode": "rw",
                "RW": true,
                "Propagation": "rprivate"
            },
            {
                "Type": "bind",
                "Source": "/home/smartsee/mysql/logs",
                "Destination": "/var/log/mysql",
                "Mode": "rw",
                "RW": true,
                "Propagation": "rprivate"
            }
        ]
```
>
```shell
get_container_volumes(){
   container=$1
   docker inspect $container --format '{{range .Mounts}}{{$path := .Source}}{{println $path}}{{end}}'
}
```

### get container networks
```
get_container_network() {
   container=$1
   docker inspect smartsee --format '{{range $k, $v := .NetworkSettings.Networks}}{{printf "%s" $k}}{{end}}'
}
```

### index
```
docker inspect bridge --format '{{(index .IPAM.Config 0).Gateway}}'
```


