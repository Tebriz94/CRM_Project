resource "azurerm_role_assignment" "aks_keyvault_access" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.kubelet_identity_object_id

  lifecycle {
    prevent_destroy = true
  }
}
