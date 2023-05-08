module "subnet" {
  source   = "github.com/worxspace/tfm-azure-subnet?ref=0.0.2"
  for_each = var.subnets == null ? {} : { for subnet in var.subnets : subnet.name => subnet }

  project-name        = each.key
  resource-prefixes   = [var.tenant-short-name]
  resource-group-name = azurerm_resource_group.lz-networking-resource-group.name
  location            = var.location

  vnet-name     = azurerm_virtual_network.lz-networking-vnet.name
  address-space = each.value.address-space
  firewall-ip   = var.firewall-ip
}
