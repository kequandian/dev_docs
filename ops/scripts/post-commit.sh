#！/bin/sh
#JENKINS_URL=xingyu.sandbox.smallsaas.cn:8000

JENKINS_URL=192.168.3.236:8000
TOKEN=sandbox
apitoken=11ae14233d5a8e361b728b98b2f76653ef
user=admin

echo curl http://$user:$apitoken@$JENKINS_URL/job/gmic-cad-war/build?token=sandbox
curl http://$user:$apitoken@$JENKINS_URL/job/gmic-cad-war/build?token=$TOKEN
