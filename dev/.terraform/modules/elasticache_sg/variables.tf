variable "vpc_id" {
  description = "The ID of the VPC where the ElastiCache security group will be created"
  type        = string
}

variable "webapp_sg_id" {
  description = "The ID of the web application security group that needs access to ElastiCache"
  type        = string
}

variable "elasticache_sg_name" {
  description = "The name of the ElastiCache security group"
  type        = string
}

variable "cache_port" {
  description = "The port on which ElastiCache will listen (6379 for Redis, 11211 for Memcached)"
  type        = number
}
