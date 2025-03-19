resource "aws_elasticache_cluster" "redis_cache" {
  cluster_id           = var.cache_cluster_id
  engine               = var.cache_engine
  node_type            = var.cache_node_type
  num_cache_nodes      = var.cache_node_count
  parameter_group_name = var.cache_parameter_group
  engine_version       = var.cache_engine_version
  subnet_group_name    = aws_elasticache_subnet_group.cache_subnet_group.name
  security_group_ids   = [var.cache_sg_id]
  port                 = var.cache_port

  tags = {
    Name = var.cache_name
  }
}

resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name       = var.cache_subnet_group_name
  subnet_ids = var.cache_subnet_ids
}
