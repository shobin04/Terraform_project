output "db_instance_ids" {
  description = "The list of DB instance IDs"
  value       = aws_instance.db[*].id
}