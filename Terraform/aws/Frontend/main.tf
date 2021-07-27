module "security_groups" {
  source = "./security_groups"
  AWS_VPC_ID = var.AWS_VPC_ID
}

module "launch_template"{
  source = "./launch_template"
  AWS_KEY_PAIR_NAME = var.AWS_KEY_PAIR_NAME
  FRONTEND_SG_ID = module.security_groups.frontend_sg_id
}

module "target_group"{
  source = "./target_groups"
  AWS_VPC_ID = var.AWS_VPC_ID
}

module "auto_scaling_group" {
  source = "./auto_scaling_group"
  FRONTEND_TG_ARN = module.target_group.target_group_arn
  public0_subnet_id = var.public0_subnet_id
  public1_subnet_id = var.public1_subnet_id
  FRONTEND_LAUNCH_TEMPLATE_ID = module.launch_template.launch_template_id
}

module "load_balancer" {
  source = "./load_balancer"
  FRONTEND_SG_ID = module.security_groups.frontend_sg_id
  FRONTEND_TG_ARN = module.target_group.target_group_arn
  public0_subnet_id = var.public0_subnet_id
  public1_subnet_id = var.public1_subnet_id
}

