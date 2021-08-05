resource "aws_security_group" "jenkins_sg" {
    name        = "ramp_up_tf_andreslopezb_jenkins_sg"
    description = "Allow rules for Jenkins instance in Terraform"
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
      project     = "ramp_up_devops"
    }
}

resource "aws_security_group_rule" "jenkins_ingress_rules" {
    count = length(var.jenkins_sg_ingress_rules)

    type              = "ingress"
    description       = var.jenkins_sg_ingress_rules[count.index].description
    from_port         = var.jenkins_sg_ingress_rules[count.index].from_port
    to_port           = var.jenkins_sg_ingress_rules[count.index].to_port
    protocol          = var.jenkins_sg_ingress_rules[count.index].protocol
    cidr_blocks       = [var.jenkins_sg_ingress_rules[count.index].cidr_block]
    security_group_id = aws_security_group.jenkins_sg.id
}



