variable "vpc_id" {
  type = string
}

variable "mobileapp_sg_name" {
  type = string
}

variable "bastion_sg_id" {
  description = "The ID of the bastion security group"
  type        = string
}

variable "mobileapp_alb_sg_id" {
  type = string
}