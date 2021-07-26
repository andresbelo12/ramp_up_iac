resource "aws_key_pair" "ramp-up-devops-andreslopezb-kp" {
  key_name = "ramp-up-devops-andreslopezb-kp"
  public_key = var.PUBLIC_KEY
  lifecycle {
        prevent_destroy = true
    }
}