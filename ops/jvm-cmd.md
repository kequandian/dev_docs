### jcmd
```
jcmd pid VM.system_properties
jcmd pid VM.flags
```

### jps
```
jps -lvm
```

### jinfo
```
jinfo -J-d64 -sysprops pid
```


### PLAYING WITH THE JVM INSIDE DOCKER CONTAINERS
> [JVM-DOCKER-CONTAINER](https://blog.nebrass.fr/playing-with-the-jvm-inside-docker-containers/)
```
$ docker container run -it --memory 800M --cpus 2 adoptopenjdk:11-jre
Dec 01, 2019 10:10:29 PM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
|  Welcome to JShell -- Version 10.0.2
|  For an introduction type: /help intro

jshell> Runtime.getRuntime().totalMemory()
$1 ==> 14221312

jshell> Runtime.getRuntime().maxMemory()
$2 ==> 202768384

jshell> Runtime.getRuntime().availableProcessors()
$3 ==> 2
```

```
$ docker container run -it --memory 800M --cpus 2 --entrypoint bash adoptopenjdk:11-jre
root@ae152619006a:/# java -XX:+PrintFlagsFinal -version | grep MaxHeapSize
   size_t MaxHeapSize         =   209715200         {product} {ergonomic}
openjdk version "10.0.2" 2018-07-17
OpenJDK Runtime Environment (build 10.0.2+13-Debian-2)
OpenJDK 64-Bit Server VM (build 10.0.2+13-Debian-2, mixed mode)
```
