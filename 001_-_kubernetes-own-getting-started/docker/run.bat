@echo off

call ..\_var.bat

docker run -d -p 80:80 --rm --name %appName% %imgName%
