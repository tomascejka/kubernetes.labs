@echo off

call ..\_var.bat

REM -- build image, priprava pro k8s
docker build -t %imgName% -f Dockerfile .
