resources = {
  rg1 = {
    name     = "jio_dev"
    location = "centralindia"
  }
  rg2 = {
    name     = "jio_qa"
    location = "centralindia"
  }
}
jio-vnets = {
  vnet1 = {
    name                = "dev-vnet"
    location            = "centralindia"
    resource_group_name = "jio_dev"
    address_space       = ["10.2.0.0/16"]
  }
  vnet2 = {
    name                = "qa-vnet"
    location            = "centralindia"
    resource_group_name = "jio_qa"
    address_space       = ["10.3.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-dev"
    resource_group_name  = "jio_dev"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.2.1.0/24"]
  }
  subnet2 = {
    name                 = "backend-dev"
    resource_group_name  = "jio_dev"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.2.2.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "jio_dev"
    virtual_network_name = "dev-vnet"
    address_prefixes     = ["10.2.3.0/26"]
  }

}

jio-pip = {
  pip1 = {
    name                = "nat_pip"
    location            = "centralindia"
    resource_group_name = "jio_dev"
  }
  pip2 = {
    name                = "bastion_pip"
    location            = "centralindia"
    resource_group_name = "jio_dev"
  }
}
jio-nsg = {
  nsg1 = {
    name                   = "linux-vm_nsg"
    location               = "centralindia"
    resource_group_name    = "jio_dev"
    rule_name              = "AllowSSH"
    priority               = 100
    protocol               = "Tcp"
    destination_port_range = "22"
    source_address_prefix  = "*"
  }
  nsg2 = {
    name                   = "window-vm_nsg"
    location               = "centralindia"
    resource_group_name    = "jio_dev"
    rule_name              = "AllowRDP"
    priority               = 100
    protocol               = "Tcp"
    destination_port_range = "3389"
    source_address_prefix  = "*"
  }
}
jio-vms = {
  nic1 = {
    name                         = "linux-vm_nic"
    location                     = "centralindia"
    resource_group_name          = "jio_dev"
    subnets_name                 = "frontend-dev"
    virtual_network_name         = "dev-vnet"
    ipconfig_name                = "dev-nic1-config"
    vm_name                      = "linuxvm1"
    vm-size                      = "Standard_D2s_v5"
    admin-username               = "abhayadmin"
    admin-password               = "data.azurerm_key_vault_secret.jio-secrets[\"secret1\"].value"
    nsg_name                     = "linux-vm_nsg"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    image_publisher              = "Canonical"
    image_offer                  = "0001-com-ubuntu-server-jammy"
    image_sku                    = "22_04-lts-gen2"
    image_version                = "latest"
  }
  nic2 = {
    name                         = "linux-vm_nic"
    location                     = "centralindia"
    resource_group_name          = "jio_dev"
    subnets_name                 = "backend-dev"
    virtual_network_name         = "dev-vnet"
    ipconfig_name                = "dev-nic2-config"
    vm_name                      = "linuxvm2"
    vm-size                      = "Standard_D2s_v5"
    admin-username               = "abhayadmin"
    admin-password               = "data.azurerm_key_vault_secret.jio-secrets[\"secret2\"].value"
    nsg_name                     = "linux-vm_nsg"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    image_publisher              = "Canonical"
    image_offer                  = "0001-com-ubuntu-server-jammy"
    image_sku                    = "22_04-lts-gen2"
    image_version                = "latest"
  }
}
jio-bastion = {
  bastion1 = {
    name                 = "jio_dev_AzureBastionHost"
    location             = "centralindia"
    resource_group_name  = "jio_dev"
    pip_name             = "bastion_pip"
    subnets_name         = "AzureBastionSubnet"
    virtual_network_name = "dev-vnet"
  }
}
jio-keyvaults = {
  kv1 = {
    name                       = "jio-dev-kv"
    location                   = "centralindia"
    resource_group_name        = "jio_dev"
    rbac_authorization_enabled = false
    sku_name                   = "standard"
    purge_protection_enabled   = true
    soft_delete_retention_days = 7
  }
  # kv2 = {
  #   name                       = "jio-qa-kv"
  #   location                   = "centralindia"
  #   resource_group_name        = "jio_qa"
  #   rbac_authorization_enabled = false
  #   sku_name                   = "standard"
  #   purge_protection_enabled   = true
  #   soft_delete_retention_days = 7
  # }
}

jio-secrets = {
  nic1 = {
    name      = "linux-vm-admin-password"
    value     = "P@ssw0rd@12345"
    key_vault = "kv1"
  }
  nic2 = {
    name      = "windows-vm-admin-password"
    value     = "P@ssw0rd@12345"
    key_vault = "kv1"
  }
}


