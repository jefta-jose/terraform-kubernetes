variable "subscription_id" {
  description = "azure subscription id"
  type = string
}

variable "rg_prefix" {
  description = "the prefix of the resource group"
  type = string
  default = "jeff"
}

variable "location" {
  description = "default location where the resource will be deployed"
  type = string
  default = "North Europe"
}

variable "cluster_location" {
  description = "location for the kurbenetes cluster"
  type = string
  default = "South Central US"
}

variable "tags" {
  description = "common tags for all resources"
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

variable "db_admin" {
  description = "admin username"
  type = string
}

variable "db_password" {
  description = "admin password"
  type = string
  sensitive = true
}

variable "db_name" {
  description = "database name"
  type = string
  default = "jeff_db"
  sensitive = true
}

variable "node_count" {
  description = "number of nodes in the aks cluster"
  type = number
  default = 2
}

variable "vm_size" {
  description = "the vm size for the aks nodes"
  type = string
  default = "Standard_B2s"
}

variable "vm_location" {
  description = "azure region where vm machines will be deployed. defaults to var.location"
  type = string
  default = "East US"
}