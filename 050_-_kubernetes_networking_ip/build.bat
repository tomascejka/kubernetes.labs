@echo off

kubectl apply -f server.yaml
timeout /T 5
kubectl get pods