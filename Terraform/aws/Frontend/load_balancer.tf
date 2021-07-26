resource "aws_lb_target_group" "tg-tf-andreslopezb-front" {
  name     = "tg-tf-andreslopezb-front"
  port     = 3030
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.ramp_up_vpc.id
  health_check {
    path                = "/"
    port                = 3030
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


resource "aws_lb" "ramp-up-tf-andreslopezb-front-lb" {
  name               = "ramp-up-tf-andreslopezb-front-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ramp_up_tf_andreslopezb_frontend_lb.id]
  subnets            = [data.aws_subnet.public0_subnet.id, data.aws_subnet.public1_subnet.id]

  enable_deletion_protection = false

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}


resource "aws_lb_listener" "tf_andreslopezb_front_lb_listener" {
  load_balancer_arn = aws_lb.ramp-up-tf-andreslopezb-front-lb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-tf-andreslopezb-front.arn
  }

  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}