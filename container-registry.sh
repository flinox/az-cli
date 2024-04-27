# Pricing Plan
# Basic ( 10GB de storage )
# Standard ( 100G de storage )
# Premium ( 500G de storage, Availability - com geo-replication, Encryption, Networking private )

image_name=hello-world
acr_name=flino
image_new_name=hello-world-flino
version=latest

echo "Autenticando - docker login"
docker login ${acr_name}.azurecr.io

echo "Autenticando - az acr"
az acr login --name ${acr_name}.azurecr.io



echo "Tageando a imagem para subir para o ACR"
docker tag ${image_name} ${acr_name}.azurecr.io/${image_new_name}:${version}


echo "Subindo imagem para o ACR - docker"
docker push ${acr_name}.azurecr.io/${image_new_name}:${version}