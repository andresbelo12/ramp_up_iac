resource "aws_lb" "ramp-up-tf-andreslopezb-back-lb" {
    name               = "ramp-up-tf-andreslopezb-back-lb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = [aws_security_group.ramp_up_tf_andreslopezb_backend_lb.id]
    subnets            = [var.public0_subnet_id, var.public1_subnet_id]

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
      target_group_arn = aws_lb_target_group.tg-tf-andreslopezb-back.arn
    }

    tags = {
      responsible = "andres.lopezb"
      project = "ramp_up_devops"
    }
}