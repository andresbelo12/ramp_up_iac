data "template_file" "bastion_template"{
    template = file("${path.module}/provisioning/bastion.sh")
    vars = {
        DB_NAME = var.RDS_DB_NAME
        DB_USER = var.RDS_DB_USERNAME
        DB_PASS = var.RDS_PASSWORD
        DB_HOST = var.RDS_HOST
    }
}

resource "aws_instance" "bastion" {
  
    ami                         = var.BASTION_AMI_ID
    instance_type               = var.BASTION_INSTANCE_TYPE
    vpc_security_group_ids      = ["${aws_security_group.ramp_up_tf_andreslopezb_bastion.id}"]
    key_name                    = var.AWS_KEY_PAIR_NAME
    subnet_id                   = var.public0_subnet_id
    user_data = data.template_file.bastion_template.rendered
    tags = {
        responsible = "andres.lopezb"
        project     = "ramp_up_devops"
        Name        = "Bastion_AndresLopezB"
    }
}