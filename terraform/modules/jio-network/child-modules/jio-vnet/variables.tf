variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

output "name" {
  value = azurerm_virtual_network.jio_vnet.name
}

output "id" {
  value = azurerm_virtual_network.jio_vnet.id
}
