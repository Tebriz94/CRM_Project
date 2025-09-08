variable "node_pool_name" {
  type = string
  default = null
}

variable "aks_id" {
  type = string
  default = null
}

variable "node_pool_vm_size" {
  type = string
  default = null
}

variable "node_pool_node_count" {
  type = number
  default = null
}

variable "node_pool_subnet_id" {
  type = string
  default = null
}

variable "node_pool_kubernetes_version" {
  type = string
  default = null
}

variable "node_pool_enable_auto_scaling" {
  type    = bool
  default = false
}

variable "node_pool_min_count" {
  type    = number
  #default = null
}

variable "node_pool_max_count" {
  type    = number
  #default = null
}

variable "node_pool_mode" {
  type    = string
  default = "User"
}

variable "node_pool_node_labels" {
  type    = map(string)
  default = {}
}

variable "node_pool_tags" {
  type    = map(string)
  default = {}
}

variable "node_pool_priority" {
  type    = string
  default = null # "Spot" üçün "Spot" yazacaqsan
}

# variable "eviction_policy" {
#   type    = string
#   default = null
# }

variable "node_pool_spot_max_price" {
  type    = number
  default = null
}

