variable "webapp_instance_type" {
  description = "instance type for bastion and private app"
  type = string
}

variable "webapp_name" {
  description = "name of server"
  type = string
}

variable "webapp_instance_count" {
  type = string
}

variable "key_name" {
  type = string
}

variable "web_tier_subnet_ids" {
  type = list(string)
}

variable "webapp_ami" {
  description = "ami for webtier ec2"
  type = string
}

variable "webapp_sg_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "webapp_ebs_volumes" {
  description = "List of EBS volumes to attach to the instance"
  type = list(object({
    device_name           = string
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  }))
  default = []
}