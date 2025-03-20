output "webapp_instance_ids" {
  value = aws_instance.webapp[*].id
}