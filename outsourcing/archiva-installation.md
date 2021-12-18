### download
https://www.apache.org/dist/archiva/2.2.6/binaries/apache-archiva-2.2.6-bin.zip

### installation
https://archiva.apache.org/docs/2.2.6/adminguide/standalone.html

### Installing as a Service on Linux
> default port: 8082
On Linux, the  script is suitable for linking or copying to /etc/init.d/archiva and running as root, as long as the RUN_AS_USER environment variable is set within the script. This will allow you to start and stop the service with:
```
cd archiva/bin
unzip apache-archiva-2.2.6-bin.zip
cd apache-archiva-2.2.6/bin
./archiva
Usage: ./archiva { console | start | stop | restart | status | dump }
./archiva start
```
