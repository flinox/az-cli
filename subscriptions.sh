dominio=flinox
subscription_name=flinox

echo "Login"
az login

echo "Login em outro tenant Entra"
az login --tenant ${dominio}

echo "Lista as subscriptions que vc tem acesso"
az account list -o table

echo "Definir uma subscription default para trabalhar"
az account set --subscription ${subscription_name}
