@echo off

echo -----------------------------------------------
echo Doplnte spravnou IP adresu (v client.yaml)
echo    - najdete atribut 'args a doplnte jednu z nize IP adres'
kubectl get pods --selector=app=service_test_pod -o jsonpath='{.items[*].status.podIP}'
echo.
echo -----------------------------------------------
pause

echo.
kubectl apply -f client_ip.yaml
kubectl apply -f client_dns.yaml

echo.
kubectl get pods

echo.
kubectl logs service-test-client1

echo.
kubectl logs service-test-client2