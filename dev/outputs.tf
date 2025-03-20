output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "web_tier_subnet_ids" {
  value = module.vpc.web_tier_subnet_ids
}

output "mobile_tier_subnet_ids" {
  value = module.vpc.mobile_tier_subnet_ids
}

output "db_tier_subnet_id" {
  value = module.vpc.db_tier_subnet_id
}

# output "eks_subnet_ids" {
#   value = module.vpc.eks_id
# }

output "webapp_instance_ids" {
  value = module.web_app.webapp_instance_ids
}

output "webapp_sg_id" {
  value = module.webapp_security_group.webapp_sg_id
}

output "mobileapp_instance_ids_from_module" {
  value = module.mobile_app.mobileapp_instance_ids
}

output "mobileapp_sg_id" {
  value = module.mobileapp_security_group.mobileapp_sg_id
}

output "bastion_id" {
  value = module.bastion.bastion_id
}

output "bastion_sg_id" {
  value = module.bastion_security_group.bastion_sg_id
}

output "db_instance_ids" {
  description = "The list of DB instance IDs"
  value       = module.db_server.db_instance_ids
}

# # output "eks_target_group_arn" {
# #   description = "ARN of the EKS Target Group from the alb module"
# #   value       = module.alb.eks_target_group_arn
# # }

# # output "https_listener_arn" {
# #   description = "ARN of the HTTPS listener from the alb module"
# #   value       = module.alb.https_listener_arn
# # }

output "webapp_alb_security_group_id" {
  description = "Security Group ID of the ALB"
  value       = module.webapp_alb_security_group.webapp_alb_sg_id
}

output "mobileapp_alb_security_group_id" {
  description = "Security Group ID of the ALB"
  value       = module.mobileapp_alb_security_group.mobileapp_alb_sg_id
}

