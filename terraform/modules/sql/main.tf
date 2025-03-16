resource "azurerm_mssql_server" "sql" {
    name = var.sql_server_name
    resource_group_name = var.resource_group_name
    location = var.location
    version = "12.0"
    administrator_login = var.db_admin
    administrator_login_password = var.db_password
}

resource "azurerm_mssql_database" "db" {
  name = var.db_name
  server_id = azurerm_mssql_server.sql.id
  collation = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = var.db_max_size
  sku_name = "Basic"
}