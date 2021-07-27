variable "RDS_ENGINE"{
}

variable "RDS_ENGINE_VERSION"{
}

variable "RDS_DB_NAME"{
}

variable "RDS_DB_USERNAME"{
}

variable "RDS_PASSWORD"{
}

variable "RDS_DEFAULT_SUBNET_GROUP" {
    default = "default-vpc-0d2831659ef89870c"
}



/*variable "rds_sg_ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for SSH connection from admin IP for RDS Instances"
        },
        {
          from_port   = 3306
          to_port     = 3306
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for HTTP MySQL Connections Terraform"
        },
    ]
}*/