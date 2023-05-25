@echo off

kubectl config use-context docker-desktop

kubectl apply -f job.yaml
kubectl apply -f pod.yaml
kubectl apply -f role.yaml
REM kubectl apply -f role-binding.yaml