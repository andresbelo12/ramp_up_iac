terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}

module "aws" {
  source = "./aws"
  AWS_KEY_PAIR_NAME         = aws_key_pair.ramp-up-devops-andreslopezb-kp.key_name
  RDS_DB_NAME               = var.RDS_DB_NAME
  RDS_DB_USERNAME           = var.RDS_DB_USERNAME
  RDS_PASSWORD              = var.RDS_PASSWORD
  RDS_ENGINE                = var.RDS_ENGINE
  RDS_ENGINE_VERSION        = var.RDS_ENGINE_VERSION
  AWS_VPC_ID                = data.aws_vpc.AWS_DEFAULT_VPC.id
}