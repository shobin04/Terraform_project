output "elasticache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = aws_elasticache_cluster.redis_cache.id
}

output "elasticache_cluster_endpoint" {
  description = "The primary endpoint of the ElastiCache cluster"
  value       = aws_elasticache_cluster.redis_cache.endpoint
}
