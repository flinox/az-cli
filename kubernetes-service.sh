image_name=redis
arquivo=mypod.yaml
aks_name=k8s-flinox
rg_name=rg-k8s-default
sp_appID=$(cat ./service-principal/sp_agent.json | jq -r .appId)
sp_password=$(cat ./service-principal/sp_agent.json | jq -r .password)

echo "Instalar o kubectl"
az aks install-cli

echo "Criando o AKS"
az aks create \
--resource-group ${rg_name} \
--name ${aks_name} \
--location brazilsouth \
--node-count 3 \
--enable-cluster-autoscaler --min-count 2 --maz-count 4 \
--generate-ssh-keys \
--network-plugin azure \
--network-policy azure \
--service-principal ${sp_appID} \
-- client-secret ${sp_password}

echo "Lista os AKS"
az aks list -o table

echo "Gerando o kubeconfig para acesso ao ambiente k8s"
echo "Local ~/.kube/config"
az aks get-credentials -n ${aks_name} -g ${rg_name} --admin


echo "Lista os nodes"
kubectl get nodes

echo "Lista os pods"
kubectl get pods


echo "Pegar o IP do service exposto no pod - ExternalIP"
kubectl get svc -n ${pod_name}


echo "Maneira simples de rodar um pod no k8s"
kubectl run -i --tty ${image_name} --image=${image_name} -- sh

echo "Aplicar uma mudança em um pod no k8s"
kubectl apply -f ${arquivo}

echo "Helm simplifica o deploy no k8s com modelos prontos (charts)"
helm install --generate-name nginx-stable/nginx-ingress

echo "Helm vc tbm pode fazer pequenas modificacoes nos charts"
helm install --generate-name nginx-stable/nginx-ingress /
--set controller.image.repository=myacr.example.com/nginx-plus-ingress /
--set controller.nginxplus=true

echo "Helm vc tbm pode fazer pequenas modificacoes a partir de um arquivo"
helm install --generate-name -f values-plus.yaml \
nginx-stable/nginx-ingress