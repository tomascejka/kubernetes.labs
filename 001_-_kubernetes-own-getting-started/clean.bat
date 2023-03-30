@echo off

call _var.bat

kubectl delete deployment helloworld
kubectl delete svc helloworld
kubectl delete svc go-hello-world

docker rm -f %appName%
docker rmi -f %imgName%
