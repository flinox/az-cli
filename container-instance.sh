rg_name=resource-group-default

echo "Exibir uma lista de containers"
az container list

echo "Create a container expondo porta 80"
az container create \
--resource-group ${rg_name} \
--name ci-container-exemplo \
--image mcr.microsoft.com/azuredocs/aci-helloworld \
--ports 80 \
--dns-name ci-container-exemplo \
--location brazilsouth

echo "Exibir um container especifico"
az container show \
--resource-group ${rg_name} \
--name ci-container-exemplo \
--output table


