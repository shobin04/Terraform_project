output "mobileapp_instance_ids" {
  description = "List of mobileapp instance IDs"
  value       = [for instance in aws_instance.mobileapp : instance.id]
}