variable "vnet_name" {
  description = "name of the virtual network"
  type = string
}

variable "vnet_address_space" {
  description = "the address space for the virtual network"
  type = list(string)
}

variable "subnet_names" {
  description = "a list of subnet names to be created"
  type = list(string)
}

variable "subnet_prefixes" {
  description = "a list of subnet address prefixes corresponding to each subnet"
  type = list(string)
}

variable "resource_group_name" {
  description = "name of the resource group where the network resource will be created"
  type = string
}

variable "location" {
  description = "azure region where location resource will be deployed"
  type = string
}

variable "tags" {
  description = "A map of tags to be appplied to the resources"
  type = map(string)
  default = {}
}