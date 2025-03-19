output "webapp_alb_arn" {
  description = "ARN of the WebApp ALB"
  value       = aws_lb.webapp_alb.arn
}

output "webapp_alb_dns_name" {
  description = "DNS name of the WebApp ALB"
  value       = aws_lb.webapp_alb.dns_name
}

output "webapp_alb_zone_id" {
  description = "Zone ID of the WebApp ALB"
  value       = aws_lb.webapp_alb.zone_id
}

output "webapp_target_group_arn" {
  description = "ARN of the WebApp Target Group"
  value       = aws_lb_target_group.webapp_tg.arn
}

# output "webapp_https_listener_arn" {
#   description = "ARN of the WebApp HTTPS listener"
#   value       = aws_lb_listener.webapp_https.arn
# }

