data "template_file" "backend_template"{
    template = file("${path.module}/scripts/api.sh")
    vars = {
      PORT    = var.PORT
      DB_NAME = var.RDS_DB_NAME
      DB_USER = var.RDS_DB_USERNAME
      DB_PASS = var.RDS_PASSWORD
      DB_HOST = var.RDS_HOST
    }
}

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

    disable_api_termination               = true
    image_id                              = var.BACKEND_AMI_ID
    instance_initiated_shutdown_behavior  = "terminate"
    instance_type                         = var.BACKEND_INSTANCE_TYPE
    key_name                              = var.AWS_KEY_PAIR_NAME
    vpc_security_group_ids                = ["${aws_security_group.ramp_up_tf_andreslopezb_backend.id}"]

    tag_specifications {
      resource_type = "instance"

      tags = {
          responsible = "andres.lopezb"
          project     = "ramp_up_devops"
      }
    }

    user_data = "${base64encode(data.template_file.backend_template.rendered)}"
}