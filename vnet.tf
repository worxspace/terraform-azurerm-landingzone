module "vnet-name" {
  source   = "app.terraform.io/worxspace/name/azurecaf"
  version  = "~>0.0.2"

  resource_type = "azurerm_virtual_network"
  name          = var.project-name
  prefixes      = var.resource-prefixes
  suffixes      = concat(var.resource-suffixes, ["001"])
  random_length = var.random-resource-suffix-length
}

module "rgname" {
  source   = "app.terraform.io/worxspace/name/azurecaf"
  version  = "~>0.0.2"

  resource_type = "azurerm_resource_group"
  name          = "${var.project-name}_networking"
  prefixes      = var.resource-prefixes
  suffixes      = concat(var.resource-suffixes, ["001"])
  random_length = var.random-resource-suffix-length
}

resource "azurerm_resource_group" "lz-networking-resource-group" {
  name     = module.rgname.result
  location = var.location
}

resource "azurerm_virtual_network" "lz-networking-vnet" {
  name                = module.vnet-name.result
  resource_group_name = azurerm_resource_group.lz-networking-resource-group.name
  address_space       = var.vnet-address-space
  location            = var.location
}

resource "azurerm_virtual_network_dns_servers" "lz-networking-vnet-dns" {
  count = var.dns-servers == null ? 0 : 1

  virtual_network_id = azurerm_virtual_network.lz-networking-vnet.id
  dns_servers        = var.dns-servers
}
