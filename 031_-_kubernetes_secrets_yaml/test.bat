@echo off

REM 
REM Vytahne si kubernetes secrets [1] a decoduje 
REM jejich base64 hodnotu do citelne podoby.
REM 
REM @see [1] https://kubernetes.io/docs/concepts/configuration/secret/
REM @see [2] https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/#use-raw-data
REM

call _var.bat

kubectl get secrets -n learn-sec

echo -------------------------------------------
echo ' founded secret:'
kubectl get secrets -n learn-sec | findstr %secret-name%


echo -------------------------------------------
echo ' decoded secret:'
kubectl get secret -n learn-sec %secret-name% -o jsonpath='{.data}'

echo.
SET /P encoded="Please enter encoded value: "
REM -- @see https://stackoverflow.com/questions/37046771/base64-encode-string-command-line-windows
echo %encoded% | openssl base64 -d