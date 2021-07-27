resource "aws_security_group" "ramp_up_tf_andreslopezb_backend" {
  name        = "ramp_up_tf_andreslopezb_backend"
  description = "Allow rules for Backend Instances in Terraform"
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

resource "aws_security_group_rule" "backend_ingress_rules" {
  count = length(var.backend_sg_ingress_rules)

  type              = "ingress"
  description      = var.backend_sg_ingress_rules[count.index].description
  from_port        = var.backend_sg_ingress_rules[count.index].from_port
  to_port          = var.backend_sg_ingress_rules[count.index].to_port
  protocol         = var.backend_sg_ingress_rules[count.index].protocol
  cidr_blocks      = [var.backend_sg_ingress_rules[count.index].cidr_block]
  security_group_id = aws_security_group.ramp_up_tf_andreslopezb_backend.id
}



resource "aws_security_group" "ramp_up_tf_andreslopezb_backend_lb" {
  name        = "ramp_up_tf_andreslopezb_backend_lb"
  description = "Allow rules for Backend Load Balancer Instances in Terraform"
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

resource "aws_security_group_rule" "backend_ingress_rules_lb" {
  count = length(var.backend_sg_ingress_rules_lb)

  type              = "ingress"
  description      = var.backend_sg_ingress_rules_lb[count.index].description
  from_port        = var.backend_sg_ingress_rules_lb[count.index].from_port
  to_port          = var.backend_sg_ingress_rules_lb[count.index].to_port
  protocol         = var.backend_sg_ingress_rules_lb[count.index].protocol
  cidr_blocks      = [var.backend_sg_ingress_rules_lb[count.index].cidr_block]
  security_group_id = aws_security_group.ramp_up_tf_andreslopezb_backend_lb.id
}