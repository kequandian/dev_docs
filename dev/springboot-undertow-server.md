## Undertow Server
[stackoverflow](https://stackoverflow.com/questions/65932548/how-to-configure-spring-boot-2-4-server-threads-in-undertow)
>
[document](https://docs.spring.io/spring-boot/docs/2.4.0/reference/htmlsingle/#server.undertow.threads.io)

```
server.undertow.threads.io //Number of I/O threads to create for the worker. The default is derived from the number of available processors.
server.undertow.threads.worker //Number of worker threads. The default is 8 times the number of I/O threads.
```
