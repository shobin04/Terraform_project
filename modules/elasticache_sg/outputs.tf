output "elasticache_sg_id" {
  description = "The ID of the ElastiCache security group"
  value       = aws_security_group.elasticache_sg.id
}
