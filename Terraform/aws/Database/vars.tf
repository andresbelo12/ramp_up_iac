variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type        = string
}

variable "RDS_ENGINE"{
    description = "Database Engine to be used in RDS, it could be mysql, postgres, and others"
    type        = string
}

variable "RDS_ENGINE_VERSION"{
    description = "The version of the database engine used in RDS, for example, 8.0.23 for mysql"
    type        = string
}

variable "RDS_DB_NAME"{
    description = "Name of the default database to be created in the RDS instance"
    type        = string
}

variable "RDS_DB_USERNAME"{
    description = "Username for the admin access to the database"
    type        = string
}

variable "RDS_PASSWORD"{
    description = "Password for the admin access to the database"
    type        = string
}

variable "RDS_DEFAULT_SUBNET_GROUP" {
    description = "ID of the default subnet group for RDS"
    default     = "default-vpc-0d2831659ef89870c"
}

