@echo off

docker build . -t tocecz/minjar

kubectl config use-context docker-desktop

kubectl apply -f job.yaml

TIMEOUT -T 5

kubectl logs job.batch/get-env