#vpc
variable "vpc_name" {
  description = "name of Vpc"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

#subnets
variable "public_subnet_cidrs" {
  description = "Public Subnet CIDR values"
  type        = list(string)
}

variable "web_tier_subnet_cidrs" {
  description = "web tier subnet CIDR values"
  type        = list(string)
}

variable "mobile_tier_subnet_cidrs" {
  description = "mobile tier subnet CIDR values"
  type        = list(string)
}

variable "db_tier_subnet_cidr" {
  description = "db instance subnet CIDR values"
  type        = string
}

variable "eks_subnet_cidrs" {
  description = "eks subnet CIDR values"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zone for subnets"
  type        = list(string)
}

##webapp##
variable "webapp_instance_type" {
  description = "instance type for bastion and private app"
  type        = string
}

variable "webapp_name" {
  description = "name of server"
  type        = string
}

variable "webapp_instance_count" {
  type = string
}

variable "webapp_ami" {
  description = "ami for webtier ec2"
  type        = string
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

variable "webapp_sg_name" {
  type = string
}

##mobileapp##
variable "mobileapp_instance_type" {
  description = "instance type for bastion and private app"
  type        = string
}

variable "mobileapp_name" {
  description = "name of server"
  type        = string
}

variable "mobileapp_instance_count" {
  type = string
}

variable "mobileapp_ami" {
  description = "ami for webtier ec2"
  type        = string
}

variable "mobileapp_sg_name" {
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

##bastion##
variable "bastion_instance_type" {
  description = "instance type for bastion and private app"
  type        = string
}

variable "bastion_ami" {
  description = "ami for bastion"
  type        = string
}

variable "bastion_name" {
  type = string
}

variable "bastion_sg_name" {
  type = string
}

##db##
variable "db_instance_type" {
  description = "instance type for bastion and private app"
  type        = string
}

variable "db_instance_count" {
  type = string
}

variable "db_ami" {
  description = "ami for db ec2"
  type        = string
}

variable "db_name" {
  type = string
}

variable "db_sg_name" {
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

##keypair##
variable "key_name" {
  type = string
}

##alb##
variable "webapp_alb_name" {
  type = string
}

variable "webapp_alb_sg_name" {
  type = string
}

variable "mobileapp_alb_name" {
  type = string
}


variable "mobileapp_alb_sg_name" {
  type = string
}

##eks##
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "k8s_version" {
  description = "Kubernetes version for the cluster"
  type        = string
}

variable "eks_instance_types" {
  description = "Instance types for worker nodes"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "cluster_role_name" {
  description = "Name of the IAM role for EKS cluster"
  type        = string
}

variable "node_role_name" {
  description = "Name of the IAM role for EKS worker nodes"
  type        = string
}

variable "eks_sg_name" {
  type = string
}
