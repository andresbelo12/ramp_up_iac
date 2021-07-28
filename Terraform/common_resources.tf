resource "aws_key_pair" "ramp-up-devops-andreslopezb-kp" {
  key_name    = "ramp-up-devops-andreslopezb-kp"
  public_key  = var.PUBLIC_KEY
}

data "aws_vpc" "AWS_DEFAULT_VPC" {
  id = var.AWS_VPC_ID
}