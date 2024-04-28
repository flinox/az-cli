sp_name=app_agent_pipeline

echo "Service Principal é como um usuario de uma aplicacao, é um app registration do Entra"
az ad sp create-for-rbac -n ${sp_name} --output json > sp_agent.json
export sp_password=$(cat ./service-principal/sp_agent.json | jq -r .password)
export sp_appID=$(cat ./service-principal/sp_agent.json | jq -r .appId)