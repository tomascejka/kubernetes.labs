@echo off

REM 
REM Zakoduje vstupni string do base64 kodovani
REM 
SET /P input="String: "
echo %input% | openssl base64