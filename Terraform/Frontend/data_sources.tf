data "aws_subnet" "public0" {
  id = var.subnet_id
}

data "aws_security_group" "frontend-sg" {
  id = var.security_group_id
}

data "aws_vpc" "ramp_up_vpc" {
  id = var.vpc_id
}