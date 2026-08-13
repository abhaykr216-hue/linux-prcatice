output "resource_group_name" {
  description = "The name of the created resource group."
  value       = module.jio_network.resource_group_name
}

output "vnet_name" {
  description = "The name of the created virtual network."
  value       = module.jio_network.vnet_name
}

output "vnet_id" {
  description = "The ID of the created virtual network."
  value       = module.jio_network.vnet_id
}

output "subnet_name" {
  description = "The name of the created subnet."
  value       = module.jio_network.subnet_name
}

output "subnet_id" {
  description = "The ID of the created subnet."
  value       = module.jio_network.subnet_id
}
