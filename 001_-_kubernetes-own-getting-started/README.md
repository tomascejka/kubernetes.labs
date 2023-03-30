# kubernetes getting started - docker desktop
Jak začít s kubernetes-em - konkrétně implementuji kapitolu 3 viz. Sources[1] viz. níže.

## Build
Zde spuštěním skriptu ```build.bat``` stáhneme ```golang``` image a sestrojíme image, která použije zdrojový kód ze souboru ```main.go```,  nad kterým bude presentována myšlenka - lokální vývoj za pomocí docker desktop nástroje.

## Test
Spuštěním skriptu ```test.ps1``` dojde k zavolání ```curl localhost:80``` a dojde k výpisu do konsole:
```
          ##         .
    ## ## ##        ==
 ## ## ## ## ##    ===
/"""""""""""""""""\___/ ===
{                       /  ===-
\______ O           __/
 \    \         __/
  \____\_______/

Hello from Docker!
```

## Change source code
Proveď změnu ve zdrojovém kódu, viz. ```main.go```, např. ```Hello from Docker and tocecz```. Nyní je nutné cluster vyčistit, spuštěním ```clean.bat``` a teprve poté znova zbuildovat aplikaci a nasadit do k8s clusteru použitím ```build.bat```. Nyní je možné ověřit změnu via ```test.ps1```:
```
          ##         .
    ## ## ##        ==
 ## ## ## ## ##    ===
/"""""""""""""""""\___/ ===
{                       /  ===-
\______ O           __/
 \    \         __/
  \____\_______/

Hello from Docker and tocecz!
```


## Sources
1. https://www.docker.com/blog/how-kubernetes-works-under-the-hood-with-docker-desktop/