# 
# Pokusi se pod najit sam dle hodnoty v cronjob.yaml metadata/name (=testcronjobdemo).
# A pote se snazit vylistovat jeho log (kubectl logs) jako dukaz, ze bezi a funguje v nem prikaz.
# Prikazem se mysli (cronjob.yaml, spec/template/spec/container/command)
#
# - prvni prikaz vypise bezici pody, 
# - awk si vezme hodnotu v prvni sloupci (NAME) to je pod_name
# - grep zajisti, ze ziskame nazev, kt. predpokladame (viz. popis vyse)
# 
kubectl config use-context docker-desktop

$pod_name=kubectl get pods --no-headers=true | awk '{print $1}' | grep testcronjob

if($null -eq $pod_name) {# pokud je pod_name null nebo empty
    Write-Output 'pod_name is null/empty - is pod running?'
} else {
    kubectl logs $pod_name
}