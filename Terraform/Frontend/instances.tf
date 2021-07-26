/*
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
*/
resource "aws_key_pair" "ramp-up-devops-andreslopezb-kp" {
  key_name = "ramp-up-devops-andreslopezb-kp"
  public_key = var.PUBLIC_KEY
}
/*
resource "aws_instance" "frontend" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "FrontendAndresLopezB"
    responsible = "andres.lopezb"
    project = "ramp_up_devops"
  }

  subnet_id = data.aws_subnet.public0.id
  vpc_security_group_ids = [data.aws_security_group.frontend-sg.id]
  key_name = aws_key_pair.ramp-up-devops-andreslopezb-kp.key_name
}
*/