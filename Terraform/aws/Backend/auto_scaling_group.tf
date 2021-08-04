resource "aws_autoscaling_group" "ramp_up_tf_asg_andreslopezb_backend" {
    name                      = "ramp_up_tf_asg_andreslopezb_backend"
    max_size                  = var.ASG_MAX_SIZE
    min_size                  = var.ASG_MIN_SIZE
    health_check_grace_period = 300
    health_check_type         = "ELB"
    desired_capacity          = var.ASG_DESIRED_CAPACITY
    force_delete              = true
    vpc_zone_identifier       = [var.private0_subnet_id, var.private1_subnet_id]
    target_group_arns         = [aws_lb_target_group.tg-tf-andreslopezb-back.arn]
    launch_template {
      id      = aws_launch_template.backend_instances.id
      version = "$Latest"
    }

    tag{
      key                 = "responsible"
      value               = "andres.lopezb"
      propagate_at_launch = true
    }

    tag{
      key                 = "project"
      value               = "ramp-up-devops"
      propagate_at_launch = true
    }

    tag{
      key                 = "Name"
      value               = "Backend_AndresLopezB_Terraform"
      propagate_at_launch = true
    }

}
