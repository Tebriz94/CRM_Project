resource "azurerm_virtual_network" "vnet" {
  name                    = var.vnet_name
  address_space           = var.vnet_address_space
  location                = var.vnet_location
  resource_group_name     = var.vnet_resource_group_name
}

resource "azurerm_subnet" "sub_vnet" {
  for_each                 = { for s in var.vnet_subnets : s.name => s }
  name                     = each.value.name
  address_prefixes         = [each.value.address_prefix]
  virtual_network_name     = azurerm_virtual_network.vnet.name
  resource_group_name      = var.vnet_resource_group_name
}


resource "azurerm_network_security_group" "nsg" {
  for_each = {for s in var.vnet_subnets : s.name => s}

  name                    = "${each.key}-nsg"
  location                = var.vnet_location
  resource_group_name     = var.vnet_resource_group_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  #for_each                   = azurerm_subnet.sub_vnet
  for_each = {
    for k, v in var.vnet_subnets : k => v if k != "AzureBastionSubnet"
  }
  subnet_id                  = azurerm_subnet.sub_vnet[each.key].id
  network_security_group_id  = azurerm_network_security_group.nsg[each.key].id

    lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_network_security_rule" "rules" {
for_each = {
  for rule_info in flatten([
    for subnet_name, rules in var.vnet_nsg_rules : [
      for rule in rules : {
        key          = "${subnet_name}-${rule.name}"
        subnet_name  = subnet_name
        rule         = rule
      }
    ]
  ]) : rule_info.key => {
    subnet_name = rule_info.subnet_name
    rule        = rule_info.rule
  }
}


  name                        = each.value.rule.name
  priority                    = each.value.rule.priority
  direction                   = each.value.rule.direction
  access                      = each.value.rule.access
  protocol                    = each.value.rule.protocol
  source_port_range           = each.value.rule.source_port_range
  destination_port_range      = each.value.rule.destination_port_range
  source_address_prefix       = each.value.rule.source_address_prefix
  destination_address_prefix  = each.value.rule.destination_address_prefix
  resource_group_name         = var.vnet_resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg[each.value.subnet_name].name

  lifecycle {
    prevent_destroy = true
  }
}


# --- Route Table for aks-subnet ---
resource "azurerm_route_table" "aks_route_table" {
  name                = "${var.vnet_env}-aks-route-table"
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name

    lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_route" "default_internet_route" {
  name                = "default-internet-route"
  resource_group_name = var.vnet_resource_group_name
  route_table_name    = azurerm_route_table.aks_route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_subnet_route_table_association" "aks_subnet_association" {
  subnet_id      = azurerm_subnet.sub_vnet["aks-subnet"].id
  route_table_id = azurerm_route_table.aks_route_table.id

  lifecycle {
    prevent_destroy = true
  }
}