provider "azurerm" {
  features {}
}

module "jio_network" {
  source = "./modules/jio-network"

  jioqa = var.jioqa
}
