variable "db_instance_type" {
  description = "instance type for bastion and private app"
  type = string
}

variable "db_instance_count" {
  type = string
}

variable "db_name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "db_tier_subnet_id" {
  type = string
}

variable "db_ami" {
  description = "ami for db ec2"
  type = string
}

variable "db_sg_id" {
  type = string
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB"
  type        = number
}

variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
}

variable "ebs_device_name" {
  description = "Name of the additional EBS volume device"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the additional EBS volume in GiB"
  type        = number
}

variable "ebs_volume_type" {
  description = "Type of the additional EBS volume"
  type        = string
}