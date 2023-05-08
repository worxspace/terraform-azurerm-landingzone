output "vnet-name" {
  value = azurerm_virtual_network.lz-networking-vnet.name
}

output "vnet-resource-group-name" {
  value = azurerm_virtual_network.lz-networking-vnet.resource_group_name
}

output "vnet-id" {
  value = azurerm_virtual_network.lz-networking-vnet.id
}
