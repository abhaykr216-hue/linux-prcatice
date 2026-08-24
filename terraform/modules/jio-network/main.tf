module "jio_resource_group" {
  source = "./child-modules/jio-resource-group"

  name     = var.jioqa.resource_group_name
  location = var.jioqa.location
  tags     = var.jioqa.tags
}

module "jio_vnet" {
  source = "./child-modules/jio-vnet"

  name                = var.jioqa.vnet_name
  location            = var.jioqa.location
  resource_group_name = var.jioqa.resource_group_name
  address_space       = var.jioqa.address_space
  tags                = var.jioqa.tags
}

module "jio_subnet" {
  for_each = var.jioqa.subnets

  source = "./child-modules/jio-subnet"

  name                 = each.key
  resource_group_name  = var.jioqa.resource_group_name
  virtual_network_name = var.jioqa.vnet_name
  address_prefixes     = [each.value]
}

module "jio_storage" {
  source = "./child-modules/jio-storage"

  name                = var.jioqa.storage_account_name
  location            = var.jioqa.location
  resource_group_name = var.jioqa.resource_group_name
  tags                = var.jioqa.tags

  depends_on = [module.jio_resource_group]
}
