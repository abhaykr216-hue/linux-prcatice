variable "jioqa" {
  type = object({
    location             = string
    resource_group_name  = string
    vnet_name            = string
    address_space        = list(string)
    subnets              = map(string)
    storage_account_name = string
    tags                 = map(string)
  })
}
