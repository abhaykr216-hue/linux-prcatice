# Jio Terraform Network Module

This Terraform configuration builds a simple Azure landing zone with:

- Resource group
- Virtual network
- Subnet

The module naming follows a Jio parent-child pattern:

- Parent: `jio-network`
- Child modules: `jio-resource-group`, `jio-vnet`, `jio-subnet`

## Usage

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Main inputs

- `location` : Azure region
- `resource_group_name` : Name of the resource group
- `vnet_name` : Name of the VNet
- `address_space` : VNet CIDR block
- `subnet_name` : Name of the subnet
- `subnet_address_prefixes` : Subnet CIDR block
- `tags` : Resource tags
```