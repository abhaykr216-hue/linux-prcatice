variable "location" {
  description = "Azure region for the Jio landing zone resources."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure resource group."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "CIDR blocks for the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "CIDR blocks for the subnet."
  type        = list(string)
}

variable "tags" {
  description = "Resource tags for Jio resources."
  type        = map(string)
}
