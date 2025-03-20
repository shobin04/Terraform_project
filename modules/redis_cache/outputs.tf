output "redis_endpoint" {
  description = "Redis endpoint address"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "redis_port" {
  description = "Redis endpoint port"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].port
}
