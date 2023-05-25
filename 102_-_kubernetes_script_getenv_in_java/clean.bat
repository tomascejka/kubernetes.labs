@echo off

kubectl delete -f job.yaml

docker rm -f tocecz/minjar
docker rmi -f tocecz/minjar