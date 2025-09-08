variable "vnet_env" {
  description = "Environment (dev, prod)"
  type        = string
  default = null
}

variable "vnet_resource_group_name" {
  type        = string
  description = "The name of the resource group"
  default = null
}

variable "vnet_location" {
  type        = string
  description = "Azure region"
  default = null
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
  default = null
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for VNet"
  default = null
}

variable "vnet_subnets" {
  description = "Map of subnets"
  type = map(object({
    name           = string
    address_prefix = string
  }))
  default = null
}


variable "vnet_nsg_rules" {
  description = "Map of NSG rules for each subnet"
  type = map(list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
  default = null
}
