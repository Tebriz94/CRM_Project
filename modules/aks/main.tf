resource "azurerm_kubernetes_cluster" "this" {
  name                = "${var.aks_env}-aks"
  location            = var.aks_location
  resource_group_name = var.aks_resource_group_name
  dns_prefix          = "${var.aks_env}-aks"
  kubernetes_version  = var.kubernetes_version
  

  default_node_pool {
    name           = "system"
    vm_size        = var.vm_size
    node_count     = var.node_count
    vnet_subnet_id = var.subnet_id
    type           = "VirtualMachineScaleSets"
    orchestrator_version = var.kubernetes_version
    auto_scaling_enabled = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
    #docker_bridge_cidr = var.docker_bridge_cidr
    #outbound_type      = "userDefinedRouting"
    outbound_type      = "loadBalancer"
    load_balancer_sku  = "standard"
  }

  private_cluster_enabled = true
  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }

  tags = {
    environment = var.aks_env
  }

  lifecycle {
    prevent_destroy = true
  }
}


