variable "aks_env" {
  type = string
  default = null
}

variable "aks_location" {
  type = string
  default = null
}

variable "aks_resource_group_name" {
  type = string
  default = null
}

variable "subnet_id" {
  type = string
  default = null
}


variable "vm_size" {
  default = "Standard_DS2_v2"
}
variable "node_count" {
  default = 1
}
variable "kubernetes_version" {
  default = "1.30.0"
}

variable "service_cidr" {
  default = "10.0.6.0/24"
}
variable "dns_service_ip" {
  default = "10.0.6.10"
}
variable "docker_bridge_cidr" {
  default = "172.17.0.1/16"
}

variable "api_server_authorized_ip_ranges" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

