variable "vpc_id" {
  type = string
}

variable "webapp_sg_name" {
  type = string
}

variable "bastion_sg_id" {
  description = "The ID of the bastion security group"
  type        = string
}

variable "webapp_alb_sg_id" {
  type = string
}