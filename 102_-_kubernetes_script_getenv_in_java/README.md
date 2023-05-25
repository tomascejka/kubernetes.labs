# kubernetes job getting started
Cilem je se naucit kuberntest job object.

## Předpoklady
Je potreba mit nainstalovany docker a kubernetes; staci Docker Desktop (win/macos/linux).

## Build
Vytvoříme soubor ```job.yaml``` (viz. níže):

```
apiVersion: batch/v1
kind: Job
metadata:
  name: testjobdemo
spec:
  template:
    spec:
      containers:
      - name: testjob
        image: alpine:latest
        command: ["ping", "-c", "10",  "8.8.8.8"]
      restartPolicy: Never
  backoffLimit: 4
```
 a necháme jej sestavit pomocí:

 ```
 kubectl apply -f job.yaml
 ```

Pozn: atributy 
	- ```restartPolicy``` 
	- a ```backofflimit``` 
jsou pro failure případy, další [info](https://kubernetes.io/docs/concepts/workloads/controllers/job/#handling-pod-and-container-failures).

## Clean
V případě, že končíš, nebo odcházíš - ukliď po sobě; buď spusť ```clean.bat```, nebo:
```
kubectl delete -f job.yaml
```

## Zdroje
1. https://kubernetes.io/docs/concepts/workloads/controllers/job/
2. https://docs.docker.com/get-started/orchestration/