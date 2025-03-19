variable "vpc_id" {
  description = "VPC ID where the ALB will be created"
  type        = string
}

variable "mobileapp_alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "mobileapp_alb_sg_id" {
  description = "Security Group ID of the EKS"
  type        = string
}

# variable "certificate_arn" {
#   description = "ARN of the SSL certificate for HTTPS listener"
#   type        = string
# }

variable "mobileapp_instance_ids" {
  description = "List of mobile app server instance IDs"
  type        = list(string)
}