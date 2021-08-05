data "template_file" "jenkins_template"{
    template = file("${path.module}/provisioning/jenkins.sh")
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_key_pair" "jenkins_key" {
  key_name   = "ramp-up-devops-andreslopezb-kp-jenkins"
  public_key = var.PUBLIC_KEY
}

resource "aws_instance" "Jenkis_Instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.JENKINS_INSTANCE_TYPE
	subnet_id 		= var.public0_subnet_id
	key_name 			= aws_key_pair.jenkins_key.key_name
	security_groups = [ aws_security_group.jenkins_sg.id ]

	ebs_block_device {
		device_name = "/dev/sda1"
		volume_size = 20
		tags = {
			responsible = "andres.lopezb"
			project     = "ramp_up_devops"
		}
	}

	user_data = "${base64encode(data.template_file.jenkins_template.rendered)}"

  tags = {
		Name 				= "Jenkins AndresLopezB Terraform"
  	responsible = "andres.lopezb"
    project     = "ramp_up_devops"
  }
}