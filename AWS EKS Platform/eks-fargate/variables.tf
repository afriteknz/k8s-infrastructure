variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "demo"
}


variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.24`)"
  type        = string
  default     = "1.25"
}