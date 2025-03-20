output "mobileapp_instance_ids" {
  value = aws_instance.mobileapp[*].id 
}