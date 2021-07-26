resource "aws_launch_template" "frontend-instances" {
  name = "frontend-lt-andreslopezb"

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


  image_id = "ami-0d382e80be7ffdae5"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"

  key_name = aws_key_pair.ramp-up-devops-andreslopezb-kp.key_name

  vpc_security_group_ids =  ["${aws_security_group.ramp_up_tf_andreslopezb_frontend.id}"]

  tag_specifications {
    resource_type = "instance"

    tags = {
        responsible = "andres.lopezb"
        project = "ramp_up_devops"
    }
  }

  //user_data = filebase64("${path.module}/example.sh")
}