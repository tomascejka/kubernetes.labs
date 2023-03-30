@echo off

call .\_var.bat

kubectl apply -f gohelloworld.yaml
