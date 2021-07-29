module "database"   {
    source = "./Database"
    AWS_VPC_ID          = var.AWS_VPC_ID
    RDS_DB_NAME         = var.RDS_DB_NAME
    RDS_DB_USERNAME     = var.RDS_DB_USERNAME
    RDS_PASSWORD        = var.RDS_PASSWORD
    RDS_ENGINE          = var.RDS_ENGINE
    RDS_ENGINE_VERSION  = var.RDS_ENGINE_VERSION
}

module "bastion"{
    source              = "./Bastion"
    AWS_KEY_PAIR_NAME   = var.AWS_KEY_PAIR_NAME
    AWS_VPC_ID          = var.AWS_VPC_ID
    RDS_DB_NAME         = var.RDS_DB_NAME
    RDS_DB_USERNAME     = var.RDS_DB_USERNAME
    RDS_PASSWORD        = var.RDS_PASSWORD
    RDS_HOST            = module.database.host_address
}

module "backend"    {
    source              = "./Backend"
    AWS_KEY_PAIR_NAME   = var.AWS_KEY_PAIR_NAME
    AWS_VPC_ID          = var.AWS_VPC_ID
    RDS_DB_NAME         = var.RDS_DB_NAME
    RDS_DB_USERNAME     = var.RDS_DB_USERNAME
    RDS_PASSWORD        = var.RDS_PASSWORD
    RDS_HOST            = module.database.host_address
    BASTION_IP          = module.bastion.bastion_ip
}


module "frontend"   {
    source              = "./Frontend"
    AWS_KEY_PAIR_NAME   = var.AWS_KEY_PAIR_NAME
    AWS_VPC_ID          = var.AWS_VPC_ID
    BACK_HOST           = module.backend.load_balancer_dns
}


