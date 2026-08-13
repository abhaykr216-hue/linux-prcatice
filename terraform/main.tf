provider "azurerm" {
  features {}
}

module "jio_network" {
  source = "./modules/jio-network"

  location                = var.location
  resource_group_name     = var.resource_group_name
  vnet_name               = var.vnet_name
  address_space           = var.address_space
  subnet_name             = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  tags                    = var.tags
}
