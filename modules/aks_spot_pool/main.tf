resource "azurerm_kubernetes_cluster_node_pool" "this" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.node_pool_vm_size
  node_count            = var.node_pool_node_count
  vnet_subnet_id        = var.node_pool_subnet_id
  orchestrator_version  = var.node_pool_kubernetes_version
  #enable_auto_scaling   = var.enable_auto_scaling
  auto_scaling_enabled  = var.node_pool_enable_auto_scaling
  min_count             = var.node_pool_min_count
  max_count             = var.node_pool_max_count
  mode                  = var.node_pool_mode
  node_labels           = var.node_pool_node_labels
  tags                  = var.node_pool_tags
  priority              = var.node_pool_priority
  #eviction_policy       = var.eviction_policy
  spot_max_price        = var.node_pool_spot_max_price

  lifecycle {
    prevent_destroy = true
  }
}

