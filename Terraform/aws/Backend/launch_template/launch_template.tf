resource "aws_launch_template" "backend_instances" {
  name = "ramp_up_backend_lt_andreslopezb"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 20
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = true

  image_id = var.BACKEND_AMI_ID

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = var.BACKEND_INSTANCE_TYPE

  key_name = var.AWS_KEY_PAIR_NAME

  vpc_security_group_ids =  ["${var.BACKEND_SG_ID}"]

  tag_specifications {
    resource_type = "instance"

    tags = {
        responsible = "andres.lopezb"
        project = "ramp_up_devops"
    }
  }

  user_data = filebase64("${path.module}/scripts/api.sh")
}