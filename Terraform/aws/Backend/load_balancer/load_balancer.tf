resource "aws_lb" "ramp-up-tf-andreslopezb-back-lb" {
  name               = "ramp-up-tf-andreslopezb-back-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.BACKEND_SG_ID]
  subnets            = [var.private0_subnet_id, var.private1_subnet_id]

  enable_deletion_protection = false

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}


resource "aws_lb_listener" "tf_andreslopezb_back_lb_listener" {
  load_balancer_arn = aws_lb.ramp-up-tf-andreslopezb-back-lb.arn
  port              = var.BACK_LB_LISTENER_PORT
  protocol          = var.BACK_LB_LISTENER_PROTOCOL
  
  default_action {
    type             = "forward"
    target_group_arn = var.BACKEND_TG_ARN
  }

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}