resource "aws_lb" "ramp-up-tf-andreslopezb-front-lb" {
    name               = "ramp-up-tf-andreslopezb-front-lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.ramp_up_tf_andreslopezb_frontend_lb.id]
    subnets            = [var.public0_subnet_id, var.public1_subnet_id]

    enable_deletion_protection = false

    tags = {
      responsible = "andres.lopezb"
      project = "ramp_up_devops"
    }
}


resource "aws_lb_listener" "tf_andreslopezb_front_lb_listener" {
    load_balancer_arn = aws_lb.ramp-up-tf-andreslopezb-front-lb.arn
    port              = var.FRONT_LB_LISTENER_PORT
    protocol          = var.FRONT_LB_LISTENER_PROTOCOL
    
    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.tg-tf-andreslopezb-front.arn
    }

    tags = {
      responsible = "andres.lopezb"
      project = "ramp_up_devops"
    }
}