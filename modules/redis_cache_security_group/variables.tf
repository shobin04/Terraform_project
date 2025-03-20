variable "vpc_id" {
  description = "VPC ID where the Redis cluster will be launched"
  type        = string
}

variable "redis_sg_name" {
  description = "Prefix for the security group name"
  type        = string
}

