variable "cluster_id" {
  description = "Redis cluster identifier"
  type        = string
}

variable "engine_version" {
  description = "Redis engine version"
  type        = string
}

variable "node_type" {
  description = "Instance type for Redis nodes"
  type        = string
}

variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type        = number
}

variable "parameter_group_name" {
  description = "Redis parameter group name"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs for the Redis cluster"
  type        = list(string)
}

variable "redis_subnet_ids" {
  description = "List of subnet IDs for Redis"
  type        = list(string)
}

variable "subnet_group_name" {
  description = "Name of the Redis subnet group"
  type        = string
}

variable "redis_name" {
  type = string
}