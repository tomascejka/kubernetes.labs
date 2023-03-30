@echo off

kubectl delete -f client_ip.yaml
kubectl delete -f client_dns.yaml
kubectl delete -f server.yaml