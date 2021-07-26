module "frontend-iac"{
    source = "./Frontend"
    PUBLIC_KEY = var.PUBLIC_KEY
    AWS_ACCESS_KEY = var.AWS_ACCESS_KEY
    AWS_SECRET_KEY = var.AWS_SECRET_KEY
}