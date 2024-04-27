echo "Exibir uma lista dos resources groups - saida default json"
az group list

echo "Exibir uma lista dos resources groups - com formato de saida em tabela"
az group list -o table

az group list --output table