variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

output "name" {
  value = azurerm_resource_group.jio_rg.name
}
