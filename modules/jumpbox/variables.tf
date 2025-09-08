variable "jumpbox_env" {
    type = string
    default = null
}

variable "jumpbox_location" {
    type = string
    default = null
}

variable "jumpbox_resource_group_name" {
    type = string
    default = null
}

variable "vm_subnet_id" {
  type = string
  default = null
}

variable "jumpbox_ssh_public_key_path" {
    type = string
    default = ""
}

variable "jumpbox_vm_size" {
  default = "Standard_B2s"
}

variable "jumpbox_admin_username" {
  type = string
  default = null
}

variable "jumpbox_cloud_init_file" {
  type = string
  default = ""
}