output "mobileapp_alb_sg_id" {
  description = "Security Group ID of the ALB"
  value       = aws_security_group.mobileapp_alb_sg.id
}