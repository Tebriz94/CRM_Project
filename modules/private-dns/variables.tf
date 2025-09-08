variable "dns_resource_group_name" {
  type = string
  default = null
}

variable "dns_location" {
  type = string
  default = null
}

variable "vnet_id" {
  type = string
  default = null
}

variable "private_dns_zones" {
  type = map(string)
  description = "Map of DNS zone names with keys (aks, acr, etc)"
  default = null
}

