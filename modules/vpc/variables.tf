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


variable "elasticache_subnet_cidrs" {
  type    = list(string)
}