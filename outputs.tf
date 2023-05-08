output "vnet-name" {
  value = azurerm_virtual_network.lz-networking-vnet.name
  description = "The name of the created virtual network"
}

output "vnet-resource-group-name" {
  value = azurerm_virtual_network.lz-networking-vnet.resource_group_name
  description = "The name of the resource group where the virtual network is created"
}

output "vnet-id" {
  value = azurerm_virtual_network.lz-networking-vnet.id
  description = "The resource id of the created virtual network"
}
