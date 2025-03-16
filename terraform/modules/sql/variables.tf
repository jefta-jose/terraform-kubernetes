variable "sql_server_name" {
  description = "name of the sql server"
  type = string
}

variable "resource_group_name" {
  description = "name of the resource group where sql will be deployed"
  type = string
}

variable "location" {
  description = "azure region"
  type = string
}

variable "db_admin" {
  description = "sql admin username"
  type = string
}

variable "db_password" {
  description = "sql admin password"
  type = string
  sensitive = true
}

variable "db_name" {
  description = "database name"
  type = string
}

variable "db_max_size" {
  description = "maximum database size in gb"
  type = number
  default = 5
}