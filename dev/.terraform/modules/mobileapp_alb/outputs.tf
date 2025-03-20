output "mobileapp_alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.mobileapp_alb.arn
}

output "mobileapp_alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.mobileapp_alb.dns_name
}

output "mobileapp_alb_zone_id" {
  description = "Zone ID of the ALB"
  value       = aws_lb.mobileapp_alb.zone_id
}

output "mobile_target_group_arn" {
  description = "ARN of the Mobile Tier Target Group"
  value       = aws_lb_target_group.mobile_tg.arn
}


# output "https_listener_arn" {
#   description = "ARN of the HTTPS listener"
#   value       = aws_lb_listener.https.arn
# }
