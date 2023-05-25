# kubernetes job getting started
Cilem zjistit, jak funguje kubernetes job a zda jde zjistit jeho stav (zda dobehl nebo upadl) - pouziji instrukci initContainers na POD-u.

## Předpoklady
Je potreba mit nainstalovany docker a kubernetes; staci Docker Desktop (win/macos/linux). Dale je potreba mit definovano pravo na volani (napr. kubectl get job) kubernetes api zevnitr klusteru (tzn. z pod-u).

Práva na kubernetes api (kt. voláme uvnitř klusteru, tzn. pod chce ověřit stav job-u) se nastavuje pomocí ```Role``` a ```RoleBinding``` objektu, viz. ```role.yaml``` a ```role-binding.yaml```. Pokud nejsou spuštěny/nastaveny oprávnění v logu pod-u (který chce prověřit stav job-u) je vidět:

```
User "system:serviceaccount:default:default" cannot get resource "jobs" in API group "batch" in the namespace "default"
```

## Build
Pomocí skriptu ```build.bat``` spustím/sestavím vše potřebné:  ```pod.yaml```, ```job.yaml```, ```role.yaml``` a ```role-binding.yaml```.

Co sestavujeme:
- ```job.yaml```, provádí ping command (omezený/30 pokusů=aby se snadno/rychle dokončil)
- ```pod.yaml```, prování echo command, když initContainers command vrátí true (zjištuje: zda job doběhl úspěšně)
- ```role.yaml```, nastavuje role pro Group.batch.job a příkazy: get, list, watch
- ```role-binding.yaml```, nastavuje role na uživatele(skupinu) a v jakem namespace, system:serviceaccounts:default

### POD se nedočká dokončení jobu

Lze simulovat takto:
1. pomocí (nenastavení=pod nebude schopen zjistit stav job-u) práv, tzn. neaplikování role-binding. Tzn. pod stále čeká, protože neví, zda job doběhl/či upadl (job sice doběhl ale pod to prostě neví).
```
kubectl get pods
NAME                 READY   STATUS      RESTARTS   AGE
check-status-qhcdr   0/1     Completed   0          93s
ping-command         0/1     Init:0/1    0          92s
```
2. nebo nastavit ```job.yaml```, že v něm běží nekončený ping command (bez omezení) ?vyzkoušet?

Pozn: atributy 
	- ```restartPolicy``` 
	- a ```backofflimit``` 
jsou pro failure případy, další [info](https://kubernetes.io/docs/concepts/workloads/controllers/job/#handling-pod-and-container-failures).

## Clean
V případě, že končíš, nebo odcházíš - ukliď po sobě; buď spusť ```clean.bat```, nebo:
```
kubectl delete -f pod.yaml
kubectl delete -f job.yaml
kubectl delete -f role.yaml
kubectl delete -f role-binding.yaml
```

## Zdroje
1. https://kubernetes.io/docs/concepts/workloads/controllers/job/
3. https://developer.ibm.com/tutorials/using-kubernetes-rbac-and-service-accounts/ << role, role_binding
2. https://docs.docker.com/get-started/orchestration/