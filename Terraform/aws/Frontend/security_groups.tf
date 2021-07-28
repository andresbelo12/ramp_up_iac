resource "aws_security_group" "ramp_up_tf_andreslopezb_frontend" {
  name        = "ramp_up_tf_andreslopezb_frontend"
  description = "Allow rules for Bastion Instances in Terraform"
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

resource "aws_security_group_rule" "frontend_ingress_rules" {
  count = length(var.frontend_sg_ingress_rules)

  type             = "ingress"
  description      = var.frontend_sg_ingress_rules[count.index].description
  from_port        = var.frontend_sg_ingress_rules[count.index].from_port
  to_port          = var.frontend_sg_ingress_rules[count.index].to_port
  protocol         = var.frontend_sg_ingress_rules[count.index].protocol
  cidr_blocks      = [var.frontend_sg_ingress_rules[count.index].cidr_block]
  security_group_id = aws_security_group.ramp_up_tf_andreslopezb_frontend.id
}



resource "aws_security_group" "ramp_up_tf_andreslopezb_frontend_lb" {
  name        = "ramp_up_tf_andreslopezb_frontend_lb"
  description = "Allow rules for Bastion Load Balancer Instances in Terraform"
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

resource "aws_security_group_rule" "frontend_ingress_rules_lb" {
  count = length(var.frontend_sg_ingress_rules_lb)

  type              = "ingress"
  description      = var.frontend_sg_ingress_rules_lb[count.index].description
  from_port        = var.frontend_sg_ingress_rules_lb[count.index].from_port
  to_port          = var.frontend_sg_ingress_rules_lb[count.index].to_port
  protocol         = var.frontend_sg_ingress_rules_lb[count.index].protocol
  cidr_blocks      = [var.frontend_sg_ingress_rules_lb[count.index].cidr_block]
  security_group_id = aws_security_group.ramp_up_tf_andreslopezb_frontend_lb.id
}