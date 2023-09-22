@echo off

call _var.bat

kubectl edit secrets %secret-name%