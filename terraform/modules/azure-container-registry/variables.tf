variable "azure_container_registry_name" {
  description = "Name of the azure container registry"
  type = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}

variable "location" {
  description = "Azure region"
  type = string
}

# A SKU (Stock Keeping Unit) in Azure is a unique identifier for a specific version 
# of a product or service. It is used to define the different versions of a service 
# that are available, such as the size of a virtual machine, the amount of storage, or the performance level of a database
variable "sku" {
  description = "ACR SKU"
  type = string
  default = "Basic"
}

variable "admin_enabled" {
  description = "Enable admin access to azure container registry"
  type = bool
  default = true
}