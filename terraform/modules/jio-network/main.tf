module "jio_resource_group" {
  source = "./child-modules/jio-resource-group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "jio_vnet" {
  source = "./child-modules/jio-vnet"

  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

module "jio_subnet" {
  source = "./child-modules/jio-subnet"

  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address_prefixes
}
