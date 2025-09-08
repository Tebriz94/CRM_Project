resource "azurerm_key_vault" "kv" {
  name                        = var.kv_name
  location                    = var.kv_location
  resource_group_name         = var.kv_rg
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.kv_sku_name
  purge_protection_enabled    = var.purge_protection_enable
  soft_delete_retention_days  = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled  # secure setup

  # RBAC model
  enable_rbac_authorization = var.enable_rbac_authorization

  tags = {
    environment = var.kv_env
  }
}
##This data source retrieves information about the Azure client 
#(i.e., the current authenticated user or service principal) that is executing the Terraform cod
data "azurerm_client_config" "current" {} 
