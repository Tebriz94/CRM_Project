variable "kv_name" {
    type = string
    default = null
}
variable "kv_location" {
    type = string
    default = null
}
variable "kv_rg" {
    type = string
    default = null
}
variable "kv_sku_name" {
  default = "standard"
}
variable "kv_env" {
    type = string
    default = null
}

variable "purge_protection_enable" {
  type = bool
  default = null
}

variable "soft_delete_retention_days" {
  type = number
  default = null
}

variable "public_network_access_enabled" {
  type = bool
  default = null
}

variable "enable_rbac_authorization" {
  type = bool
  default = null
}