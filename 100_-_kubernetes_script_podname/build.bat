@echo off

kubectl config use-context docker-desktop

kubectl apply -f job.yaml