@echo off

call ..\_var.bat

docker login docker.io
docker push %imgName%:latest
