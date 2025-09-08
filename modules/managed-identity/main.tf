resource "azurerm_user_assigned_identity" "this" {
  name                = var.jumpbox_managed_identity_name
  location            = var.jumpbox_managed_identity_location
  resource_group_name = var.jumpbox_managed_identity_resource_group_name
}
