variable "jumpbox_managed_identity_name" {
  type        = string
  description = "Managed Identity name"
}

variable "jumpbox_managed_identity_location" {
  type        = string
  description = "Location for the identity"
}

variable "jumpbox_managed_identity_resource_group_name" {
  type        = string
  description = "Resource group name"
}
