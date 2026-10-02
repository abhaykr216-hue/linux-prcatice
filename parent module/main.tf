module "resoure_group" {
  source = "../child module/resource_group"
  rgs    = var.resources

}
module "virtual_network" {
  depends_on = [module.resoure_group]
  source     = "../child module/virtual_network"
  vnets      = var.jio-vnets

}
module "subnets" {
  depends_on = [module.virtual_network]
  source     = "../child module/azure_subnet"
  subnets    = var.subnet

}
module "azurerm_public_ip" {
  depends_on = [module.resoure_group]
  source     = "../child module/azure_pip"
  pips       = var.jio-pip

}
module "azurerm_network_security_group" {
  depends_on = [module.resoure_group]
  source     = "../child module/azure_nsg"
  nsgs       = var.jio-nsg
}
# module "azurerm_network_interface" {
#   depends_on = [ module.resoure_group,module.subnets,module.virtual_network ]
#   source = "../child module/azure_nic"
#   nics = var.jio-nic
# }
module "azurerm_bastion_host" {
  depends_on = [module.subnets, module.azurerm_public_ip]
  source     = "../child module/azure_Bastion"
  bastion    = var.jio-bastion
}
module "azurerm_key_vault" {
  depends_on = [module.resoure_group]
  source     = "../child module/azure_keyvault"
  keyvaults  = var.jio-keyvaults
  secrets    = var.jio-secrets
}

module "azurerm_linux_virtual_machine" {
  depends_on = [module.subnets, module.azurerm_network_security_group, module.azurerm_key_vault]
  source     = "../child module/azure_nic"
  nics = {
    for k, v in var.jio-vms : k => merge(v, {
      secret_name  = var.jio-secrets[k].name
      key_vault_id = module.azurerm_key_vault.key_vault_ids[var.jio-secrets[k].key_vault]
    })
  }
}
