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
  resource_group_name = module.jio_resource_group.name
  address_space       = var.address_space
  tags                = var.tags
}

module "jio_subnet" {
  source = "./child-modules/jio-subnet"

  name                 = var.subnet_name
  resource_group_name  = module.jio_resource_group.name
  virtual_network_name = module.jio_vnet.name
  address_prefixes     = var.subnet_address_prefixes
}
