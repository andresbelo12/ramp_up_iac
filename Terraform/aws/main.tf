module "frontend-iac"   {
  source = "./Frontend"
  AWS_KEY_PAIR_NAME   = var.AWS_KEY_PAIR_NAME
  AWS_VPC_ID          = var.AWS_VPC_ID
}


module "database-iac"   {
  source = "./Database"
  RDS_DB_NAME         = var.RDS_DB_NAME
  RDS_DB_USERNAME     = var.RDS_DB_USERNAME
  RDS_PASSWORD        = var.RDS_PASSWORD
  RDS_ENGINE          = var.RDS_ENGINE
  RDS_ENGINE_VERSION  = var.RDS_ENGINE_VERSION
  AWS_VPC_ID          = var.AWS_VPC_ID
}

module "backend-iac"    {
  source = "./Backend"
  AWS_KEY_PAIR_NAME   = var.AWS_KEY_PAIR_NAME
  AWS_VPC_ID          = var.AWS_VPC_ID
}
