output "acr_registry_id" {
  value = azurerm_container_registry.dev_acr.id
}

output "acr_name" {
  value = azurerm_container_registry.dev_acr.name
}

output "acr_login_server" {
  value = azurerm_container_registry.dev_acr.login_server
}
