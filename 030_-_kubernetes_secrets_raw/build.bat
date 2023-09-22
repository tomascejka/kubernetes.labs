@echo off

call _var.bat

REM -- @see https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/#use-raw-data
kubectl create secret generic %secret-name% ^
    --from-literal=username=admin ^
    --from-literal=password='S!B\*d$zDsb='