output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
  #value = module.network[0].vnet_id
  #value = length(module.network) > 0 ? module.network[0].vnet_id : ""
}

output "subnet_ids" {
        value = {
             for k, s in azurerm_subnet.sub_vnet : k => s.id
         }
  # value = module.network[0].subnet_ids
  #value = module.network[0].subnet_ids
  #value = length(module.network) > 0 ? module.network[0].subnet_ids : {}
}

output "nsg_ids" {
  value = {
    for k, nsg in azurerm_network_security_group.nsg : k => nsg.id
  }
}
