@echo off

call _var.bat

kubectl delete -f %yaml%