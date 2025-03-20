variable "cache_cluster_id" {
  description = "Unique identifier for the cache cluster"
  type        = string
}

variable "cache_engine" {
  description = "The name of the cache engine (e.g., redis or memcached)"
  type        = string
}

variable "cache_engine_version" {
  description = "The version of the cache engine"
  type        = string
}

variable "cache_node_type" {
  description = "The compute and memory capacity of the cache nodes"
  type        = string
}

variable "cache_node_count" {
  description = "Number of cache nodes"
  type        = number
}

variable "cache_parameter_group" {
  description = "The parameter group associated with the cache cluster"
  type        = string
}

variable "cache_sg_id" {
  description = "Security group ID for the cache cluster"
  type        = string
}

variable "cache_port" {
  description = "The port on which the cache cluster accepts connections"
  type        = number
}

variable "cache_name" {
  description = "Name tag for the cache cluster"
  type        = string
}

variable "cache_subnet_group_name" {
  description = "The name of the ElastiCache subnet group"
  type        = string
}

variable "cache_subnet_ids" {
  description = "List of subnet IDs for the cache cluster"
  type        = list(string)
}
