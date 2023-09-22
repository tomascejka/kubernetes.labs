$secretName='db-user-pass'

kubectl get secrets

echo -------------------------------------------
echo ' founded secret:'
kubectl get secrets | findstr ${secretName}


echo -------------------------------------------
echo ' encoded secret:'
$encoded=$(kubectl get secret ${secretName} -o jsonpath='{.data}')
echo ${encoded}

echo -------------------------------------------
echo ' decoded secret:'
$encodedInput = Read-Host "Please enter encoded value: "
$decoded=[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($encodedInput))
echo ${decoded}