# kubernetes job getting started
Cilem zjistit, jak funguje kubernetes job a zda jde zjistit jeho stav (zda dobehl nebo upadl) - pouziji instrukci initContainers na POD-u.

## Závěr
Cesta ke zjištění stavu jobu byla trnitá a výsledek je akceptovatelný (=je funkční), ale příkazem, kterým to zjištuji je označen jako experimental (kubectl wait)!

## Předpoklady
Je potreba mit nainstalovany docker a kubernetes; staci Docker Desktop (win/macos/linux). Dale je potreba mit definovano pravo na volani (napr. kubectl get job) kubernetes api zevnitr klusteru (tzn. z pod-u).

Práva na kubernetes api (kt. voláme uvnitř klusteru, tzn. pod chce ověřit stav job-u) se nastavuje pomocí ```Role``` a ```RoleBinding``` objektu, viz. ```role.yaml``` a ```role-binding.yaml```. Pokud nejsou spuštěny/nastaveny oprávnění v logu pod-u (který chce prověřit stav job-u) je vidět:

```
User "system:serviceaccount:default:default" cannot get resource "jobs" in API group "batch" in the namespace "default"
```

## Build
Pomocí skriptu ```build.bat``` spustím/sestavím vše potřebné:  ```pod.yaml``` (obsahuje Role a RoleBinding) a kubernetes job (skript funguje v modech: positive/negative scenario), jehož práce je předmětem zájmu (jak dopadne).

- ```job.yaml```, provádí ping command (omezený/30 pokusů=aby se snadno/rychle dokončil, positivni scénář)
- ```job-fail.yaml```, provádí ping command (neomezený ping, simulace negativního scénaře, kt. nedoběhne)
- ```pod.yaml```, prování echo command (aka aplikace), ale pouze když ```initContainers``` command vrátí true (zjištuje: zda job doběhl úspěšně) dále (ale to pouze z důvodu security) nastavuje role pro Group.batch.job a příkazy: get, list, watch a také nastavuje role na uživatele(skupinu) a v jakém namespace, system:serviceaccounts:default
- ```agent.yaml```, pomocný kontainer pro spouštění bash příkazů (neslouží pro finalní výsledek); pomáhá k analýze neočekáváného chování laboratoře.

## Test
Stačí spustit ```build.bat```, který Vás vyzve, zda chcete simulovat positivní nebo negativní scénář. Poté pomocí časovačů vypisuje v intervalech stav klusteru (stav jobu,)

## Clean
V případě, že končíš, nebo odcházíš - ukliď po sobě; buď spusť ```clean.bat```, nebo:
```
kubectl delete -f pod.yaml
kubectl delete -f job.yaml
kubectl delete -f agent.yaml
```

## Zdroje
1. https://kubernetes.io/docs/concepts/workloads/controllers/job/
2. https://developer.ibm.com/tutorials/using-kubernetes-rbac-and-service-accounts/ << role, role_binding
3. https://docs.docker.com/get-started/orchestration/
4. https://www.mankier.com/1/kubectl-wait
5. https://kubernetes.io/docs/tasks/debug/debug-application/debug-init-containers/ << jak cist logy z initContainer-u
6. https://linuxize.com/post/bash-until-loop/ << příkaz v bash, který zjistí true/false o stavu jobu v k8s