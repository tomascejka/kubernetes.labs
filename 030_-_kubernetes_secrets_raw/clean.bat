@echo off

call _var.bat

kubectl delete secret %secret-name%