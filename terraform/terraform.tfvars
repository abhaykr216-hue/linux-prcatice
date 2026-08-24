jioqa = {
  location            = "eastus"
  resource_group_name = "rg-jioqa"
  vnet_name           = "vnet-jioqa"
  address_space       = ["10.10.0.0/16"]
  subnets = {
    snet-jioqa-app = "10.10.1.0/24"
    snet-jioqa-db  = "10.10.2.0/24"
  }
  storage_account_name = "stjioqadata"
  tags = {
    environment = "qa"
    owner       = "jio"
    managed_by  = "terraform"
  }
}