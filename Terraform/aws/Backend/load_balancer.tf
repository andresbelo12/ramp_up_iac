resource "aws_lb_target_group" "tg-tf-andreslopezb-back" {
  name     = "tg-tf-andreslopezb-back"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.AWS_VPC_ID
  health_check {
    path                = "/"
    port                = 3000
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-499"
  }
  
  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}


resource "aws_lb" "ramp-up-tf-andreslopezb-back-lb" {
  name               = "ramp-up-tf-andreslopezb-back-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ramp_up_tf_andreslopezb_backend_lb.id]
  subnets            = [data.aws_subnet.private0_subnet.id, data.aws_subnet.private1_subnet.id]

  enable_deletion_protection = false

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}


resource "aws_lb_listener" "tf_andreslopezb_back_lb_listener" {
  load_balancer_arn = aws_lb.ramp-up-tf-andreslopezb-back-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-tf-andreslopezb-back.arn
  }

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}