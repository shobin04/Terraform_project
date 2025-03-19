variable "mobileapp_instance_type" {
  description = "instance type for bastion and private app"
  type = string
}

variable "mobileapp_name" {
    description = "name of server"
  type = string
}

variable "mobileapp_instance_count" {
  type = string
}

variable "key_name" {
  type = string
}

variable "mobile_tier_subnet_ids" {
  type = list(string)
}

variable "mobileapp_ami" {
  description = "ami for webtier ec2"
  type = string
}

variable "mobileapp_sg_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "mobileapp_ebs_volumes" {
  description = "List of EBS volumes to attach to the instance"
  type = list(object({
    device_name           = string
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  }))
  default = []
}