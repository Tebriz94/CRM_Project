variable "acr_id" {
  type = string
  default = null
}
variable "principal_id" {
  description = "Kubelet identity of the AKS cluster"
  type        = string
  default = null
}
