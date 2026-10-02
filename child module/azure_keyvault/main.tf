data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
    for_each = var.keyvaults
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = each.value.sku_name
  rbac_authorization_enabled = each.value.rbac_authorization_enabled

  purge_protection_enabled   = each.value.purge_protection_enabled
  soft_delete_retention_days = each.value.soft_delete_retention_days
}
resource "azurerm_key_vault_secret" "vm_password" {
  for_each = var.secrets

  name         = each.value.name
  value        = each.value.value
  key_vault_id = azurerm_key_vault.kv[each.value.key_vault].id
}