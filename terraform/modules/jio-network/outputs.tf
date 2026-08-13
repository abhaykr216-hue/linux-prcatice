output "resource_group_name" {
  value = module.jio_resource_group.name
}

output "vnet_name" {
  value = module.jio_vnet.name
}

output "vnet_id" {
  value = module.jio_vnet.id
}

output "subnet_name" {
  value = module.jio_subnet.name
}

output "subnet_id" {
  value = module.jio_subnet.id
}
