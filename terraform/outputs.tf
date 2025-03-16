output "resource_group_name" {
  description = "the name of the created resource group"
  value = azurerm_resource_group.rg.name
}

output "azurerm_kluster_service_name" {
  description = "name of the aks cluster"
  value = module.aks.azurerm_kluster_service_name
}

output "azure_container_registry_name" {
  description = "name of the acr"
  value = module.acr.azure_container_registry_name
}

output "sql_server_name" {
  description = "name of the sql server"
  value = module.sql.sql_server_name
}

output "database_name" {
  description = "name of the azure sql database"
  value = module.sql.database_name
  sensitive = true
}