terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

//create an azure resource group
resource "azurerm_resource_group" "rg" {
  name = "${var.rg_prefix}-rg"
  location = var.location
  tags = var.tags
}

//deploy azure kurbenetes service
module "aks" {
  source = "./modules/azure-kurbenetes-service"
  azurerm_kluster_service_name = "${var.rg_prefix}-aks"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix = var.rg_prefix
  node_count = var.node_count
  vm_size = var.vm_size
  depends_on = [ module.acr ]
}

//deploy azure container registry
module "acr" {
  source = "./modules/azure-container-registry"
  azure_container_registry_name = "${var.rg_prefix}azurecontainerreigstry"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku = "Basic"
  admin_enabled = true
  depends_on = [ azurerm_resource_group.rg ]
}

//deploy a virtual network with subnets for aks db and subnets
module "network" {
  source = "./modules/networking"
  vnet_name = "${var.rg_prefix}vnet"
  vnet_address_space  = ["10.0.0.0/16"]
  subnet_names = [ "aks-subnet" , "db-subnet", "public-subnet" ]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  tags = var.tags
}

module "sql" {
  source = "./modules/sql"
  sql_server_name = "${var.rg_prefix}-sql"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  db_admin = var.db_admin
  db_password = var.db_password
  db_name = var.db_name
  db_max_size = 2
  depends_on = [ azurerm_resource_group.rg ]
}