resource "azurecaf_name" "lz-networking-lzhub-peering-name" {
  resource_type = "azurerm_virtual_network_peering"
  name          = "${var.name}-hub"
  prefixes      = [var.tenant-short-name]
}

resource "azurerm_virtual_network_peering" "lz-hub" {
  name                      = azurecaf_name.lz-networking-lzhub-peering-name.result
  resource_group_name       = azurerm_resource_group.lz-networking-resource-group.name
  virtual_network_name      = azurerm_virtual_network.lz-networking-vnet.name
  remote_virtual_network_id = var.hub-vnet.id
}

resource "azurecaf_name" "lz-networking-hublz-peering-name" {
  resource_type = "azurerm_virtual_network_peering"
  name          = "hub-${var.name}"
  prefixes      = [var.tenant-short-name]
}

resource "azapi_resource" "virtualNetworkPeerings" {
  type      = "Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-05-01"
  name      = azurecaf_name.lz-networking-hublz-peering-name.result
  parent_id = var.hub-vnet.id

  body = jsonencode({
    properties = {
      # allowForwardedTraffic     = try(each.value.allow_forwarded_traffic, false)
      # allowGatewayTransit       = try(each.value.allow_gateway_transit, false)
      # allowVirtualNetworkAccess = try(each.value.allow_virtual_network_access, true)
      # doNotVerifyRemoteGateways = try(each.value.do_not_verify_remote_gateways, false)
      # useRemoteGateways         = try(each.value.use_remote_gateways, false)
      remoteVirtualNetwork = {
        id = azurerm_virtual_network.lz-networking-vnet.id
      }
    }
  })

}
