/*resource "aws_placement_group" "ramp_up_tf_tg_andreslopezb_frontend" {
  name     = "ramp_up_tf_tg_andreslopezb_frontend"
  strategy = "spread"
  tags = {
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }
}*/

resource "aws_autoscaling_group" "ramp_up_tf_asg_andreslopezb_frontend" {
  name                      = "ramp_up_tf_asg_andreslopezb_frontend"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  //placement_group           = aws_placement_group.ramp_up_tf_tg_andreslopezb_frontend.id
  vpc_zone_identifier       = [data.aws_subnet.public0_subnet.id, data.aws_subnet.public1_subnet.id]
  target_group_arns         = [aws_lb_target_group.tg-tf-andreslopezb-front.arn ]
  launch_template {
    id      = aws_launch_template.frontend_instances.id
    version = "$Latest"
  }

  tag{
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

}

/*resource "aws_autoscaling_attachment" "ramp_up_tf_asg_attachment_front_lb" {
  autoscaling_group_name = aws_autoscaling_group.ramp_up_tf_asg_andreslopezb_frontend.id
  alb_target_group_arn   = aws_lb_target_group.test.arn
}*/