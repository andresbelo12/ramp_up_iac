module "frontend-iac" {
  source = "./Frontend"
  AWS_KEY_PAIR = var.AWS_KEY_PAIR
}