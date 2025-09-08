output "dns_zone_names" {
  value = [for zone in azurerm_private_dns_zone.zones : zone.name]
}
