module "vpc" {
  source = "./vpc"
}

module "security_groups" {
  source = "./security_groups"
  vpc_id = module.vpc.vpc_id
}

module "load_balancer" {
  source = "./load_balancer"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
}

module "autoscaling" {
  source = "./autoscaling"
  public_subnets = module.vpc.public_subnets
  private_subnets = module.vpc.private_subnets
  target_group_arn = module.load_balancer.nlb_target_group_arn
  sg_a_id = module.security_groups.sg_a_id
  sg_b_id = module.security_groups.sg_b_id
  sg_c_id = module.security_groups.sg_c_id
}

module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  database_subnet_group_name = module.vpc.database_subnet_group_name
  security_group_ids = [module.security_groups.sg_a_id, module.security_groups.sg_b_id, module.security_groups.sg_c_id]
}

module "s3" {
  source = "./s3"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}
