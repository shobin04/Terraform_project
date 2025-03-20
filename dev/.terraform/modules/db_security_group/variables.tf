variable "vpc_id" {
  type = string
}

variable "bastion_sg_id" {
  description = "The ID of the bastion security group"
  type        = string
}

variable "webapp_sg_id" {
  description = "The ID of the bastion security group"
  type        = string
}

variable "db_sg_name" {
  type = string
}
