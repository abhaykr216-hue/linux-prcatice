variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_prefixes" {
  type = list(string)
}

output "name" {
  value = azurerm_subnet.jio_subnet.name
}

output "id" {
  value = azurerm_subnet.jio_subnet.id
}
