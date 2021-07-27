
resource "aws_autoscaling_group" "ramp_up_tf_asg_andreslopezb_backend" {
  name                      = "ramp_up_tf_asg_andreslopezb_backend"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  //placement_group           = aws_placement_group.ramp_up_tf_tg_andreslopezb_frontend.id
  vpc_zone_identifier       = [data.aws_subnet.private0_subnet.id, data.aws_subnet.private1_subnet.id]
  target_group_arns         = [aws_lb_target_group.tg-tf-andreslopezb-back.arn ]
  launch_template {
    id      = aws_launch_template.backend_instances.id
    version = "$Latest"
  }

  tag{
    key                 = "foo"
    value               = "bar"
    propagate_at_launch = true
  }

}

