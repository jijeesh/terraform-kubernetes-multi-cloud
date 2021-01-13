#!/usr/bin/env bash
set -eo pipefail
declare -r DIR=$(dirname ${BASH_SOURCE[0]})
file=~/.kube/aks
az account list --output table
declare -a subscriptions
subscriptions+=("xxxxx-xxxx-xxx-xxx-xxxx")
subscriptions+=("xxxxx-xxxx-xxx-xxx-xxxx")
for sub in "${subscriptions[@]}"
do
    echo "$sub"

    az account set --subscription "$sub"
    az account list --output table

    for list in $(az aks list -o json | jq -c '.[]| {aks: .name,rs: .resourceGroup}')
    do
    aks=$(echo ${list} | jq -r '.aks') 
    rs=$(echo ${list} | jq -r '.rs') 
    az aks get-credentials --resource-group  ${rs} --name ${aks} --overwrite-existing -f $file 
    az aks get-credentials --resource-group  ${rs} --name ${aks} --overwrite-existing -f ~/.kube/jijeesh/${aks}
done
done
