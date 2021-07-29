resource "aws_security_group" "ramp_up_tf_sg_andreslopezb_rds" {
  name        = "ramp_up_tf_andreslopezb_rds"
  description = "Allow rules for RDS Database in Terraform"
  vpc_id      = "vpc-0d2831659ef89870c"
 
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}

resource "aws_security_group_rule" "rds_mysql_rule" {

  type              = "ingress"
  description       = "Rule for HTTP MySQL Connections Terraform"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["10.1.80.0/21","10.1.88.0/21"]
  security_group_id = aws_security_group.ramp_up_tf_sg_andreslopezb_rds.id
}