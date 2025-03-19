output "webapp_instance_ids" {
  description = "List of WebApp instance IDs"
  value       = [for instance in aws_instance.webapp : instance.id]
}
