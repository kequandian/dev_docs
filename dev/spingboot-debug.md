## 远程调试 springboot 

#### 在`docker-compose.yml`中增加`JAVA_OPTS`

```YAML
version: "3.4"
services:
  api:
    image: adoptopenjdk:11-jre-hotspot
    environment: 
      JAVA_OPTS: "$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"
    command:
      - /bin/sh
      - -c
      - |
        java $JAVA_OPTS -jar *.jar --sprint.profiles.active=dev --server.port=8080      
```

