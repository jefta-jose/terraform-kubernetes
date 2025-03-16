output "vnet_name" {
  description = "the name of the virtual network"
  value = azurerm_virtual_network.vnet.name
}

output "vnet_id" {
  description = "the id of the virtual network"
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "a map of subnet names to their ids"
  value = {
    for i, subnet in azurerm_subnet.subnets : subnet.name => subnet.id
  }
}

output "subnet_names" {
  description = "a list of subnet names"
  value = var.subnet_names
}