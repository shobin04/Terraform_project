variable "eks_sg_name" {
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
  default     = {}
}
