data "aws_subnet" "private0_subnet" {
  id = var.private0_subnet_id
}

data "aws_subnet" "private1_subnet" {
  id = var.private1_subnet_id
}
