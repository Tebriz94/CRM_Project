variable "log_location" {
  type = string
  default = null
}

variable "log_env" {
  type = string
  default = null
}

variable "log_rg" {
  type = string
  default = null
}

variable "log_sku" {
  type = string
  default = null
}

variable "log_retention_in_days" {
  type = number
  default = null
}

variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
  default = null
}