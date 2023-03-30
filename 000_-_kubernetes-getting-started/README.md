# kubernetes getting started
Jak začít s kubernetes-em - čerpá z článku viz Sources[1] a konkrétně implementuje kapitolu 2. Výsledkem je bežící webová aplikace na adrese ```http://localhost:80```.

## Předpoklady
Spuštěný docker a kubernetes cluster - ideálně pomocí docker deskto (=pro jednoduchost).

## Build
Spustěním skriptu ```build.bat``` se (spustí příkaz ```kubectl apply -f tutorial.yaml```, [apply](https://kubectl.docs.kubernetes.io/guides/config_management/apply/) který) vytvoří kubernetes objekty ```Service``` a ```Deployment``` dle souboru ```tutorial.yml```. Tím se stáhne docker image ```https://hub.docker.com/r/docker/getting-started``` s ([nodejs](https://github.com/docker/getting-started/blob/master/Dockerfile)) aplikací a poté se spustí kontejner s aplikaci na adrese ```http://localhost:80```.

```
kubectl apply -f tutorial.yaml
service/tutorial created
deployment.apps/tutorial created
```

## Run
Otevřete si [odkaz](http://localhost:80) ve svém prohlížeči nebo pokud máte Chrome prohlížeč, spusťte ```run.bat```.


## Kontexty
Zobraz seznam všech dostupných (nakonfigurovaných) k8s kontextů:
```
kubectl config get-contexts 

CURRENT   NAME             CLUSTER          AUTHINFO                         NAMESPACE
*         docker-desktop   docker-desktop   docker-desktop
          minikube         minikube         minikube                         default
          sdxplaks         sdxplaks         clusterUser_SDX-PL-RG_sdxplaks   cam
```
Přepnutí kontextu
```
kubectl config use-context docker-desktop
Switched to context docker-desktop.
```
Zdroj - https://linuxhint.com/kubectl-list-switch-context/

## Validace yaml souborů
Mě pomohl tento nástroj - https://www.yamllint.com/

## Sources
1. https://www.docker.com/blog/how-kubernetes-works-under-the-hood-with-docker-desktop/
2. https://hub.docker.com/r/docker/getting-started