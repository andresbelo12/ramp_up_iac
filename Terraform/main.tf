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
  AWS_KEY_PAIR = aws_key_pair.ramp-up-devops-andreslopezb-kp.key_name
}