resource "azurerm_container_registry" "dev_acr" {
  name                = var.acr_name
  resource_group_name = var.acr_resource_group_name
  location            = var.acr_location
  sku                 = var.acr_sku
  admin_enabled       = var.admin_enabled_acr

  tags = {
    environment = "dev"
    project     = "demodevproject"
  } 

  lifecycle {
    prevent_destroy = true
  }
}

