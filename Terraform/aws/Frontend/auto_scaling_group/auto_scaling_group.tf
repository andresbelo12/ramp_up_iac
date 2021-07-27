resource "aws_autoscaling_group" "ramp_up_tf_asg_andreslopezb_frontend" {
  name                      = "ramp_up_tf_asg_andreslopezb_frontend"
  max_size                  = var.ASG_MAX_SIZE
  min_size                  = var.ASG_MIN_SIZE
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = var.ASG_DESIRED_CAPACITY
  force_delete              = true
  vpc_zone_identifier       = [var.public0_subnet_id, var.public1_subnet_id]
  target_group_arns         = [var.FRONTEND_TG_ARN ]
  launch_template {
    id      = var.FRONTEND_LAUNCH_TEMPLATE_ID
    version = "$Latest"
  }

  tag{
    key                 = "responsible"
    value               = "andres.lopezb"
    propagate_at_launch = true
  }

}
