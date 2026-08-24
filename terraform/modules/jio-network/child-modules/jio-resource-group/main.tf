resource "azurerm_resource_group" "jio_rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
}
