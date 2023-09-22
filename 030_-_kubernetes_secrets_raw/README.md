# kubectl create secret using raw way
Naucime se pouzivat kubernetes secret objekt a spravovat jej via kubectl cli. Cela magie se tyka pouziti ```kubectl <get|edit|describe> secrets <secret-name>``` cli api.

## Build
Pomoci ```build.bat``` vytvoříme nový ```Secret``` objekt (viz. níže), který pojmenujeme ```db-user-pass```  a použijeme pro studijní účely.

Různé varianty
```
# -- bash
kubectl create secret generic db-user-pass \
    --from-literal=username=admin \
    --from-literal=password='S!B\*d$zDsb='

REM -- cmd
kubectl create secret generic db-user-pass ^
    --from-literal=username=admin ^
    --from-literal=password='S!B\*d$zDsb='

# -- powershell
kubectl create secret generic db-user-pass `
    --from-literal=username=admin `
    --from-literal=password='S!B\*d$zDsb='
```

## Test
Nyní si ověříme, že jsem založili korektně ```kubernetes secret``` name=```db-user-pass```. Tzn. spuštěním ```test.bat``` si vypíšeme/vyfiltrujeme secret, pak jej vypíšeme (hodnoty zakódované via base64) a ve finále si dekodujeme ji do plain hodnoty.

## Edit
Pridana hodnota je ze muzeme dany secret objekt i editovat, viz. ```edit.bat```. To spustí nativní text. editor ve vašem OS (Win=notepad) a otevře yaml descriptor pro ```secret kubernetes objekt```. Pote zkusme zmenit hodnotu klice ```username``` (bacha musite ji zakodovat do base64, pouzijte ```encode.bat```) a pote yaml soubor ulozte a zavrete. Pote zopakujte ```test.bat``` a nechte si decodovat/vypsat ```username``` a uvidite zmenenou hodnotu.

## Sources
+ https://kubernetes.io/docs/tasks/configmap-secret/managing-secret-using-kubectl/#use-raw-data << hlavni zdroj
+ https://kubernetes.io/docs/concepts/configuration/secret/ << seznameni se secrete k8s objektem