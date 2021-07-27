variable "AWS_ACCESS_KEY" {
  description = "User access key for access to AWS"
  type = string
}

variable "AWS_SECRET_KEY" {
  description = "User secret key for access to AWS"
  type = string
}

variable "AWS_REGION" {
  description = "AWS Region where the infrestructure will be deployed"
  default = "eu-west-1"
  type = string
}

variable "PUBLIC_KEY" {
  description = "Public SSH key for key the key pair that will be used to access to all the instances"
  type = string
}

variable "RDS_ENGINE"{
  description = "Database Engine to be used in RDS, it could be mysql, postgres, and others"
  type = string
  default = "mysql"
}

variable "RDS_ENGINE_VERSION"{
  description = "The version of the database engine used in RDS, for example, 8.0.23 for mysql"
  type = string
  default = "8.0.23"
}

variable "RDS_DB_NAME"{
  description = "Name of the default database to be created in the RDS instance"
  type = string
}

variable "RDS_DB_USERNAME"{
  description = "Username for the admin access to the database"
  type = string
}

variable "RDS_PASSWORD"{
  description = "Password for the admin access to the database"
  type = string
}

variable "AWS_VPC_ID" {
  description = "ID of the VPC to be used in the infrastructure"
  type    = string
  default = "vpc-0d2831659ef89870c"
}