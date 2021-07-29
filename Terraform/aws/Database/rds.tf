resource "aws_db_instance" "ramp-up-tf-andreslopezb-rds" {
    identifier = "ramp-up-tf-andreslopezb-rds" 
    allocated_storage    = 10
    engine               = var.RDS_ENGINE
    engine_version       = var.RDS_ENGINE_VERSION
    instance_class       = "db.t2.micro"
    name                 = var.RDS_DB_NAME
    username             = var.RDS_DB_USERNAME
    password             = var.RDS_PASSWORD
    deletion_protection  = false
    skip_final_snapshot  = true

    db_subnet_group_name = var.RDS_DEFAULT_SUBNET_GROUP
    vpc_security_group_ids = [aws_security_group.ramp_up_tf_sg_andreslopezb_rds.id]
  
    tags = {
          responsible = "andres.lopezb"
          project = "ramp_up_devops"
    }

}