@echo off

kubectl config use-context docker-desktop

kubectl apply -f cronjob.yaml