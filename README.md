# tfm-azure-landingzone

Creates landing zone in azure in a standardised way using the latest recommendations.

We use azurecaf\_name to generate a unique name for the user assigned identity.
so make sure to provide the project-name, prefixes, suffixes as necessary

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | >=1.3.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | =>2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | >=1.3.0 |
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | =>2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet"></a> [subnet](#module\_subnet) | github.com/worxspace/tfm-azure-subnet | 0.0.2 |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.virtualNetworkPeerings](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azurecaf_name.lz-networking-hublz-peering-name](https://registry.terraform.io/providers/aztfmod/azurecaf/>2.0.0-preview3/docs/resources/name) | resource |
| [azurecaf_name.lz-networking-lzhub-peering-name](https://registry.terraform.io/providers/aztfmod/azurecaf/>2.0.0-preview3/docs/resources/name) | resource |
| [azurecaf_name.lz-networking-resource-group-name](https://registry.terraform.io/providers/aztfmod/azurecaf/>2.0.0-preview3/docs/resources/name) | resource |
| [azurecaf_name.lz-networking-vnet-name](https://registry.terraform.io/providers/aztfmod/azurecaf/>2.0.0-preview3/docs/resources/name) | resource |
| [azurerm_resource_group.lz-networking-resource-group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.lz-networking-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_dns_servers.lz-networking-vnet-dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers) | resource |
| [azurerm_virtual_network_peering.lz-hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns-servers"></a> [dns-servers](#input\_dns-servers) | list of dns servers to be used in the virtual network | `list(string)` | `null` | no |
| <a name="input_firewall-ip"></a> [firewall-ip](#input\_firewall-ip) | ip address of the firewall used for forward subnet traffic to the internet | `string` | n/a | yes |
| <a name="input_global-tags"></a> [global-tags](#input\_global-tags) | tags to be applied to all resources | `map(string)` | `{}` | no |
| <a name="input_hub-vnet"></a> [hub-vnet](#input\_hub-vnet) | attributes identifying the hub virtual network | <pre>object({<br>    name                = string<br>    resource-group-name = string<br>    id                  = string<br>  })</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | value for the location of the virtual machines | `string` | `"switzerlandnorth"` | no |
| <a name="input_project-name"></a> [project-name](#input\_project-name) | used as the main part of the name of the virtual machine | `string` | n/a | yes |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | resource group where you want to create the virtual machines | `string` | n/a | yes |
| <a name="input_resource-prefixes"></a> [resource-prefixes](#input\_resource-prefixes) | these are prefixed to resource names and usually include the tenant short name and/or the environment name | `list(string)` | `[]` | no |
| <a name="input_resource-suffixes"></a> [resource-suffixes](#input\_resource-suffixes) | these are appended to resource names and usually include the numbers when multiple resource with the same name exist | `list(string)` | `[]` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | list of subnets to be created in the virtual network | <pre>list(object({<br>    name          = string<br>    address-space = string<br>  }))</pre> | `null` | no |
| <a name="input_vnet-address-space"></a> [vnet-address-space](#input\_vnet-address-space) | address space of the virtual network for this landing zone | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet-id"></a> [vnet-id](#output\_vnet-id) | The resource id of the created virtual network |
| <a name="output_vnet-name"></a> [vnet-name](#output\_vnet-name) | The name of the created virtual network |
| <a name="output_vnet-resource-group-name"></a> [vnet-resource-group-name](#output\_vnet-resource-group-name) | The name of the resource group where the virtual network is created |
