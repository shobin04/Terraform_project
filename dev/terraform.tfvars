##vpc##
vpc_name                 = "my-vpc"
cidr_block               = "10.0.0.0/16"
public_subnet_cidrs      = ["10.0.1.0/24"]
web_tier_subnet_cidrs    = ["10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
mobile_tier_subnet_cidrs = ["10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24"]
db_tier_subnet_cidr      = "10.0.8.0/24"
# eks_subnet_cidrs = ["10.0.9.0/24", "10.0.10.0/24", "10.0.11.0/24"]
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

##security group##
bastion_sg_name       = "windows-bastion-sg"
webapp_sg_name        = "webapp-sg"
mobileapp_sg_name     = "mobileapp-sg"
db_sg_name            = "sql-db-sg"
webapp_alb_sg_name    = "web-alb"
mobileapp_alb_sg_name = "mobile-alb"

##keypair##
key_name = "zinghr"

##bastion server##
bastion_ami           = "ami-00df93d2d2da073e8"
bastion_instance_type = "t2.micro"
bastion_name          = "windows-bastion"

##webapp server##
webapp_instance_count = 3
webapp_ami            = "ami-00df93d2d2da073e8"
webapp_instance_type  = "t2.small"
webapp_name           = "webapp"

#webapp EBS Volume Configuration
webapp_ebs_volumes = [
  {
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  },
  {
    device_name           = "/dev/xvdc"
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
]

##mobileapp server##
mobileapp_instance_count = 3
mobileapp_ami            = "ami-00df93d2d2da073e8"
mobileapp_instance_type  = "t2.small"
mobileapp_name           = "mobileapp"

#mobileapp EBS Volume Configuration
mobileapp_ebs_volumes = [
  {
    device_name           = "/dev/xvdb"
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  },
  {
    device_name           = "/dev/xvdc"
    volume_type           = "gp2"
    volume_size           = 30
    delete_on_termination = true
  }
]


##db##
db_instance_count = 3
db_ami            = "ami-00df93d2d2da073e8"
db_instance_type  = "t2.small"
db_name           = "sql db"
root_volume_size  = "50"
root_volume_type  = "gp3"
ebs_device_name   = "/dev/sdf"
ebs_volume_size   = "100"
ebs_volume_type   = "gp3"

##alb##
webapp_alb_name = "webapp-alb"
mobileapp_alb_name = "mobileapp-alb"

