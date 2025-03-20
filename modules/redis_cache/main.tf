resource "aws_elasticache_cluster" "redis" {
  cluster_id           = var.cluster_id
  engine               = "redis"
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnets.name
  security_group_ids   = var.security_group_ids

  tags = {
    Name = var.redis_name
  }
}

resource "aws_elasticache_subnet_group" "redis_subnets" {
  name       = var.subnet_group_name
  subnet_ids = var.redis_subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}
