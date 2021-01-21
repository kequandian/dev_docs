#!/bin/sh

root=${PWD}
echo root=$root

echo curl -sL https://../docker-compose.yml -o $root/dist/index.html
curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/docker/tag/web/docker-compose.yml -o $root/docker-compose.yml
# curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/docker/tag/web/Dockerfile -o Dockerfile

if [ ! -d ./dist ];then
   echo mkdir $root/dist
   mkdir $root/dist
   echo curl -sL https://../index.html -o $root/dist/index.html
   curl -sL https://raw.githubusercontent.com/kequandian/dev_docs/master/ops/docker/tag/web/dist/index.html -o $root/dist/index.html
fi

if [ -f docker-compose.yml ];then
#    echo docker-compose build
#    docker-compose build
   echo docker-compose run --rm web
   docker-compose run --rm web
else
   echo docker-compose.yml download fails!
fi
