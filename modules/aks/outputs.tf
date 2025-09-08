# output "aks_id" {
#   value = azurerm_kubernetes_cluster.this.id
# }

output "aks_name" {
  value = azurerm_kubernetes_cluster.this.name
}

output "aks_resource_group" {
  value = azurerm_kubernetes_cluster.this.node_resource_group
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.this.id
}

output "principal_id" {
  value = azurerm_kubernetes_cluster.this.identity[0].principal_id
}

output "aks_kubelet_identity" {
  value = {
    object_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
    client_id = azurerm_kubernetes_cluster.this.kubelet_identity[0].client_id
  }
}