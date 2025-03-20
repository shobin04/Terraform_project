##vpc##
module "vpc" {
  source                   = "/mnt/d/zinghr/Terraform/modules/vpc"
  vpc_name                 = var.vpc_name
  cidr_block               = var.cidr_block
  public_subnet_cidrs      = var.public_subnet_cidrs
  web_tier_subnet_cidrs    = var.web_tier_subnet_cidrs
  mobile_tier_subnet_cidrs = var.mobile_tier_subnet_cidrs
  db_tier_subnet_cidr      = var.db_tier_subnet_cidr
  eks_subnet_cidrs         = var.eks_subnet_cidrs
  redis_subnet_cidrs       = var.redis_subnet_cidrs
  availability_zones       = var.availability_zones
}

##security groups##
module "webapp_alb_security_group" {
  source             = "/mnt/d/zinghr/Terraform/modules/webapp_alb_security_group"
  vpc_id             = module.vpc.vpc_id
  webapp_alb_sg_name = var.webapp_alb_sg_name
}

module "mobileapp_alb_security_group" {
  source                = "/mnt/d/zinghr/Terraform/modules/mobileapp_alb_security_group"
  vpc_id                = module.vpc.vpc_id
  mobileapp_alb_sg_name = var.mobileapp_alb_sg_name
}

module "bastion_security_group" {
  source          = "/mnt/d/zinghr/Terraform/modules/bastion_security_group"
  vpc_id          = module.vpc.vpc_id
  bastion_sg_name = var.bastion_sg_name
}

module "webapp_security_group" {
  source           = "/mnt/d/zinghr/Terraform/modules/webapp_security_group"
  vpc_id           = module.vpc.vpc_id
  webapp_sg_name   = var.webapp_sg_name
  bastion_sg_id    = module.bastion_security_group.bastion_sg_id
  webapp_alb_sg_id = module.webapp_alb_security_group.webapp_alb_sg_id
}

module "mobileapp_security_group" {
  source              = "/mnt/d/zinghr/Terraform/modules/mobileapp_security_group"
  vpc_id              = module.vpc.vpc_id
  bastion_sg_id       = module.bastion_security_group.bastion_sg_id
  mobileapp_sg_name   = var.mobileapp_sg_name
  mobileapp_alb_sg_id = module.mobileapp_alb_security_group.mobileapp_alb_sg_id
}

module "db_security_group" {
  source        = "/mnt/d/zinghr/Terraform/modules/db_server_security_group"
  vpc_id        = module.vpc.vpc_id
  bastion_sg_id = module.bastion_security_group.bastion_sg_id
  db_sg_name    = var.db_sg_name
  webapp_sg_id  = module.webapp_security_group.webapp_sg_id
}

module "eks_security_group" {
  source      = "/mnt/d/zinghr/Terraform/modules/eks_security_group"
  vpc_id      = module.vpc.vpc_id
  eks_sg_name = var.eks_sg_name
  tags        = var.tags
}

module "redis_security_group" {
  source        = "/mnt/d/zinghr/Terraform/modules/redis_cache_security_group"
  redis_sg_name = var.redis_sg_name
  vpc_id        = module.vpc.vpc_id
}

##keypair##
module "key_pair" {
  source   = "/mnt/d/zinghr/Terraform/modules/keypair"
  key_name = var.key_name
}

##bastion server##
module "bastion" {
  source                = "/mnt/d/zinghr/Terraform/modules/bastion_server"
  bastion_ami           = var.bastion_ami
  bastion_instance_type = var.bastion_instance_type
  bastion_name          = var.bastion_name
  public_subnet_id      = module.vpc.public_subnet_ids[0]
  bastion_sg_id         = module.bastion_security_group.bastion_sg_id
  key_name              = var.key_name
  vpc_id                = module.vpc.vpc_id
}

##webapp server##
module "web_app" {
  source                = "/mnt/d/zinghr/Terraform/modules/webapp_server"
  webapp_instance_count = var.webapp_instance_count
  webapp_ami            = var.webapp_ami
  webapp_instance_type  = var.webapp_instance_type
  webapp_name           = var.webapp_name
  web_tier_subnet_ids   = module.vpc.web_tier_subnet_ids
  webapp_sg_id          = module.webapp_security_group.webapp_sg_id
  key_name              = var.key_name
  vpc_id                = module.vpc.vpc_id
  webapp_ebs_volumes    = var.webapp_ebs_volumes
}

##mobileapp server##
module "mobile_app" {
  source                   = "/mnt/d/zinghr/Terraform/modules/mobileapp_server"
  mobileapp_instance_count = var.mobileapp_instance_count
  mobileapp_ami            = var.mobileapp_ami
  mobileapp_instance_type  = var.mobileapp_instance_type
  mobileapp_name           = var.mobileapp_name
  mobile_tier_subnet_ids   = module.vpc.mobile_tier_subnet_ids
  mobileapp_sg_id          = module.mobileapp_security_group.mobileapp_sg_id
  key_name                 = var.key_name
  vpc_id                   = module.vpc.vpc_id
  mobileapp_ebs_volumes    = var.mobileapp_ebs_volumes
}

##db server##
module "db_server" {
  source            = "/mnt/d/zinghr/Terraform/modules/db_server"
  db_instance_count = var.db_instance_count
  db_ami            = var.db_ami
  db_instance_type  = var.db_instance_type
  db_tier_subnet_id = module.vpc.db_tier_subnet_id
  key_name          = var.key_name
  db_sg_id          = module.db_security_group.db_sg_id
  db_name           = var.db_name
  root_volume_size  = var.root_volume_size
  root_volume_type  = var.root_volume_type
  ebs_device_name   = var.ebs_device_name
  ebs_volume_size   = var.ebs_volume_size
  ebs_volume_type   = var.ebs_volume_type
}

##EKS##
module "eks_iam" {
  source            = "/mnt/d/zinghr/Terraform/modules/eks_iam"
  cluster_role_name = var.cluster_role_name
  node_role_name    = var.node_role_name
}

##eks cluster##
module "eks_cluster" {
  source                = "/mnt/d/zinghr/Terraform/modules/eks_cluster"
  cluster_name          = var.cluster_name
  cluster_role_arn      = module.eks_iam.cluster_role_arn
  node_role_arn         = module.eks_iam.node_role_arn
  eks_subnet_ids        = module.vpc.eks_subnet_ids
  eks_security_group_id = module.eks_security_group.eks_security_group_id
  k8s_version           = var.k8s_version
  desired_capacity      = var.desired_capacity
  max_capacity          = var.max_capacity
  min_capacity          = var.min_capacity
  eks_instance_types    = var.eks_instance_types
  tags                  = var.tags
}

##redis cache##
module "redis_cache" {
  source               = "/mnt/d/zinghr/Terraform/modules/redis_cache"
  redis_name           = var.redis_name
  cluster_id           = var.cluster_id
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  security_group_ids   = [module.redis_security_group.redis_sg_id]
  redis_subnet_ids     = module.vpc.redis_subnet_ids
  subnet_group_name    = var.subnet_group_name
}

##alb##
module "webapp_alb" {
  source              = "/mnt/d/zinghr/Terraform/modules/webapp_alb"
  vpc_id              = module.vpc.vpc_id
  webapp_alb_name     = var.webapp_alb_name
  subnet_ids          = module.vpc.web_tier_subnet_ids
  webapp_alb_sg_id    = module.webapp_alb_security_group.webapp_alb_sg_id
  webapp_instance_ids = module.web_app.webapp_instance_ids
  #certificate_arn        = var.certificate_arn
}


module "mobileapp_alb" {
  source                 = "/mnt/d/zinghr/Terraform/modules/mobileapp_alb"
  vpc_id                 = module.vpc.vpc_id
  mobileapp_alb_name     = var.mobileapp_alb_name
  subnet_ids             = module.vpc.mobile_tier_subnet_ids
  mobileapp_instance_ids = module.mobile_app.mobileapp_instance_ids
  mobileapp_alb_sg_id    = module.mobileapp_alb_security_group.mobileapp_alb_sg_id
  #certificate_arn        = var.certificate_arn
}
