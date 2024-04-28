
app_service_name=asp-teste
web_app_name=stapp-teste
resource_group_name=rg-teste

echo "Criar o appservice pĺan! necessario para a web app"
az appservice plan create \
--name ${app_service_name} \
--resource-group ${resource_group_name} \
--sku F1

# F1(Free)
# D1(Shared)
# B1(Basic Small)
# B2(Basic Medium)
# S1(Standard Small)
# P1V2(Premium V2 Small)
# etc...

echo "Criar o web app - static app"
az webapp create \
--name ${web_app_name} \
--plan ${app_service_name} \
--resource-group ${resource_group_name}

echo "Autoscaling feature Azure Web Apps custom scale only on tier Standard or higher"

