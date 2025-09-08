resource "azurerm_private_dns_zone" "zones" {
  for_each            = var.private_dns_zones
  name                = each.value
  resource_group_name = var.dns_resource_group_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  for_each                = var.private_dns_zones
  name                    = "${each.key}-vnet-link"
  resource_group_name     = var.dns_resource_group_name
  private_dns_zone_name   = azurerm_private_dns_zone.zones[each.key].name

  virtual_network_id      = var.vnet_id
  registration_enabled    = false

  lifecycle {
    prevent_destroy = true
  }
}


