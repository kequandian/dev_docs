#!/bin/sh
if [ ! -d ~/.m2 ];then
  mkdir ~/.m2
fi
if [ ! -f ~/settings.xml ];then 
  docker run --rm -v /root/.m2:/var/m2 zelejs/allin-web:alpine-m2 cp /root/.m2/settings.xml /var/m2
fi

SRC=${MAVEN_WORKING_DIR}
if [ ! $SRC ];then 
   echo env MAVEN_WORKING_DIR not defined !
   exit
fi

# docker-compose -f mvn.yml run --rm maven bash
docker run --rm -it -v /root/.m2:/root/.m2 -v $SRC:/usr/src -w /usr/src maven:3.6-openjdk-11-slim mvn $@
