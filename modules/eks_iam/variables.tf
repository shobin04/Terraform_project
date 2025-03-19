variable "cluster_role_name" {
  description = "Name of the IAM role for EKS cluster"
  type        = string
}

variable "node_role_name" {
  description = "Name of the IAM role for EKS worker nodes"
  type        = string
}
