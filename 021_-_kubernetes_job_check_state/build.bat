@echo off

kubectl config use-context docker-desktop

REM -- job, ktery ma predstavovat zavislost (predpoklad) pro beh aplikace
SET /P opt="Simulate negative scenario?, y: "
IF [%opt%] EQU [y] (
	kubectl apply -f job-fail.yaml
) ELSE (
	kubectl apply -f job.yaml
)
REM -- nasazuji aplikaci, kt. ma initContainer hlidajici, zda job dokoncil uspesne praci
kubectl apply -f pod.yaml

TIMEOUT -T 5
call :check_state
TIMEOUT -T 10
call :check_state
TIMEOUT -T 15
call :check_state
TIMEOUT -T 15
call :check_state
goto eof

:check_state
echo.
echo -----------------------------------------
echo.
kubectl get pods
echo --
kubectl logs job/check-status
echo --
REM -- log initContainers, see https://kubernetes.io/docs/tasks/debug/debug-application/debug-init-containers/
kubectl logs pod/echo-command -c init-pod
echo --
kubectl logs pod/echo-command

:eof