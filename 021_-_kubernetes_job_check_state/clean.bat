@echo off

kubectl config use-context docker-desktop

kubectl delete -f pod.yaml
kubectl delete -f job.yaml
kubectl delete -f job-fail.yaml
kubectl delete -f agent.yaml