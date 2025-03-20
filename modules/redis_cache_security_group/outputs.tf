output "redis_sg_id" {
  description = "Redis security group ID"
  value       = aws_security_group.redis_sg.id
}