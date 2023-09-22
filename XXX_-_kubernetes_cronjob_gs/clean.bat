@echo off

kubectl config use-context docker-desktop

kubectl delete -f cronjob.yaml