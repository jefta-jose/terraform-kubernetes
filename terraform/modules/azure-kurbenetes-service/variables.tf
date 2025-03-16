variable "azurerm_kluster_service_name" {
  description = "Name of the azuer kluster service"
  type = string
}

variable "location" {
  description = "Azure region"
  type = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type = string
}

# dns_prefix is part of the endpoint that you use to communicate with your Azure Kubernetes Service (AKS) cluster.
# If you set:
# dns_prefix = "myaks"
# Azure will create an API server URL like:

# myaks-dns.eastus.cloudapp.azure.com
# So when you run a command like:

# kubectl get nodes
# Your computer connects to this endpoint to get data from the cluster.
variable "dns_prefix" {
  description = "DNS prefix for the kurbenetes service"
  type = string
}

variable "node_count" {
  description = "Number of nodes in the azure kurbenetes service"
  type = number
  default = 2
}

variable "vm_size" {
  description = "VM Size for azure kurbenetes service nodes"
  type = string
  default = "Standard_B2s"
}