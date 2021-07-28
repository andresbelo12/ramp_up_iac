resource "aws_lb_target_group" "tg-tf-andreslopezb-back" {
    name     = "tg-tf-andreslopezb-back"
    port     = var.TG_BACK_PORT
    protocol = var.TG_BACK_PROTOCOL
    vpc_id   = var.AWS_VPC_ID
    health_check {
      path                = var.TG_HC_BACK_PATH
      port                = var.TG_HC_BACK_PORT
      protocol            = var.TG_HC_BACK_PROTOCOL
      healthy_threshold   = 3
      unhealthy_threshold = 3
      matcher             = var.TG_HC_BACK_MATCHER
    }
    
    tags = {
      responsible = "andres.lopezb"
      project = "ramp_up_devops"
    }
}