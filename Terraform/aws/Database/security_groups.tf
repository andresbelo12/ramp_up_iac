/*resource "aws_security_group" "ramp_up_tf_andreslopezb_rds" {
  name        = "ramp_up_tf_andreslopezb_rds"
  description = "Allow rules for RDS Database in Terraform"
  vpc_id      = var.AWS_VPC_ID
 
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

resource "aws_security_group_rule" "rds_ingress_rules" {
  count = length(var.rds_sg_ingress_rules)

  type              = "ingress"
  description      = var.rds_sg_ingress_rules[count.index].description
  from_port        = var.rds_sg_ingress_rules[count.index].from_port
  to_port          = var.rds_sg_ingress_rules[count.index].to_port
  protocol         = var.rds_sg_ingress_rules[count.index].protocol
  cidr_blocks      = [var.rds_sg_ingress_rules[count.index].cidr_block]
  security_group_id = aws_security_group.ramp_up_tf_andreslopezb_rds.id
}
*/