resource "aws_lb_target_group" "tg-tf-andreslopezb-front" {
    name     = "tg-tf-andreslopezb-front"
    port     = var.TG_FRONT_PORT
    protocol = var.TG_FRONT_PROTOCOL
    vpc_id   = var.AWS_VPC_ID
    health_check {
      path                = var.TG_HC_FRONT_PATH
      port                = var.TG_HC_FRONT_PORT
      protocol            = var.TG_HC_FRONT_PROTOCOL
      healthy_threshold   = 3
      unhealthy_threshold = 3
      matcher             = var.TG_HC_FRONT_MATCHER
    }
    
    tags = {
      responsible = "andres.lopezb"
      project = "ramp_up_devops"
    }
}