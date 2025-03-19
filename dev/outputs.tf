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

output "eks_subnet_ids" {
  value = module.vpc.eks_subnet_ids
}

output "webapp_instance_ids" {
  value = module.web_app.webapp_instance_ids
}

output "webapp_sg_id" {
  value = module.webapp_security_group.webapp_sg_id
}

output "mobileapp_instance_ids" {
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

output "webapp_alb_arn" {
  description = "ARN of the WebApp ALB"
  value       = module.webapp_alb.webapp_alb_arn
}

output "webapp_alb_dns_name" {
  description = "DNS name of the WebApp ALB"
  value       = module.webapp_alb.webapp_alb_dns_name
}

output "webapp_alb_zone_id" {
  description = "Zone ID of the WebApp ALB"
  value       = module.webapp_alb.webapp_alb_zone_id
}

output "webapp_target_group_arn" {
  description = "ARN of the WebApp Target Group"
  value       = module.webapp_alb.webapp_target_group_arn
}

# Uncomment if HTTPS listener is added
# output "webapp_https_listener_arn" {
#   description = "ARN of the WebApp HTTPS listener"
#   value       = module.webapp_alb.webapp_https_listener_arn
# }

output "mobileapp_alb_arn" {
  description = "ARN of the Mobile App ALB"
  value       = module.mobileapp_alb.mobileapp_alb_arn
}

output "mobileapp_alb_dns_name" {
  description = "DNS name of the Mobile App ALB"
  value       = module.mobileapp_alb.mobileapp_alb_dns_name
}

output "mobileapp_alb_zone_id" {
  description = "Zone ID of the Mobile App ALB"
  value       = module.mobileapp_alb.mobileapp_alb_zone_id
}

output "mobile_target_group_arn" {
  description = "ARN of the Mobile Tier Target Group"
  value       = module.mobileapp_alb.mobile_target_group_arn
}

output "elasticache_subnet_id" {
  value = module.vpc.elasticache_subnet_id
}

output "elasticache_cluster_id" {
  description = "The ID of the ElastiCache cluster"
  value       = module.elasticache.elasticache_cluster_id
}

output "elasticache_endpoint" {
  description = "The primary endpoint of the ElastiCache cluster"
  value       = module.elasticache.elasticache_endpoint
}

output "elasticache_sg_id" {
  description = "The security group ID for ElastiCache"
  value       = module.elasticache_security_group.elasticache_sg_id
}

output "cluster_id" {
  description = "The EKS cluster ID"
  value       = module.eks_cluster.cluster_id
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = module.eks_cluster.cluster_endpoint
}

output "cluster_version" {
  description = "The Kubernetes version for the cluster"
  value       = module.eks_cluster.cluster_version
}

output "node_group_arn" {
  description = "ARN of the worker node group"
  value       = module.eks_cluster.node_group_arn
}

output "eks_security_group_id" {
  description = "The ID of the EKS security group"
  value       = module.eks_security_group.eks_security_group_id
}
