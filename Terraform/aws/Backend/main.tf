module "security_groups" {
  source = "./security_groups"
  AWS_VPC_ID = var.AWS_VPC_ID
}

module "launch_template"{
  source = "./launch_template"
  AWS_KEY_PAIR_NAME = var.AWS_KEY_PAIR_NAME
  BACKEND_SG_ID = module.security_groups.backend_sg_id
}

module "target_group"{
  source = "./target_groups"
  AWS_VPC_ID = var.AWS_VPC_ID
}

module "auto_scaling_group" {
  source = "./auto_scaling_group"
  BACKEND_TG_ARN = module.target_group.target_group_arn
  private0_subnet_id = var.private0_subnet_id
  private1_subnet_id = var.private1_subnet_id
  BACKEND_LAUNCH_TEMPLATE_ID = module.launch_template.launch_template_id
}

module "load_balancer" {
  source = "./load_balancer"
  BACKEND_SG_ID = module.security_groups.backend_sg_id
  BACKEND_TG_ARN = module.target_group.target_group_arn
  private0_subnet_id = var.private0_subnet_id
  private1_subnet_id = var.private1_subnet_id
}

