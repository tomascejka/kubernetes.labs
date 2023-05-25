@echo off

kubectl delete -f pod.yaml
kubectl delete -f job.yaml
kubectl delete -f role.yaml
kubectl delete -f role-binding.yaml