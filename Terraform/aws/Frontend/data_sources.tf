data "aws_security_group" "frontend_sg" {
  id = var.security_group_id
}

data "aws_vpc" "ramp_up_vpc" {
  id = var.vpc_id
}

data "aws_subnet" "public0_subnet" {
  id = var.public0_subnet_id
}

data "aws_subnet" "public1_subnet" {
  id = var.public1_subnet_id
}
