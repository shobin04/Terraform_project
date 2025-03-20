output "elasticache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = aws_elasticache_cluster.redis_cache.id
}
