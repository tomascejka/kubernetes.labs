@echo off

SET yaml=Setup.yaml
REM -- docker-desktop, azieku1kub185 (BEL/SAN)
SET ctxName=docker-desktop
SET namespace=learn-sec
SET secret-name=db-cred

echo ========================================
echo   k8s namespace: %ctxName%
echo            file: %yaml%
echo ========================================

kubectl config use-context %ctxName%