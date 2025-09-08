resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.log_env}-log-workspace"
  location            = var.log_location
  resource_group_name = var.log_rg
  sku                 = var.log_sku
  retention_in_days   = var.log_retention_in_days

  tags = {
    environment = var.log_env
  }

  lifecycle {
    prevent_destroy = true
  }
}



resource "azurerm_monitor_diagnostic_setting" "aks_logs" {
  name                       = "aks-monitoring"
  target_resource_id         = var.aks_cluster_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_log {
    category = "kube-apiserver"

  }

  enabled_log {
    category = "kube-controller-manager"
    #enabled  = true

    # retention_policy {  depreciated
    #   enabled = false
    #   days    = 0
    # }
  }

  enabled_log {
    category = "kube-scheduler"
    #enabled  = true
  }

  enabled_log {
    category = "kube-audit"
    #enabled  = true
  }

  lifecycle {
    prevent_destroy = true
  }
  
}
