variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "PUBLIC_KEY" {
}

variable "RDS_ENGINE"{
  default = "mysql"
}

variable "RDS_ENGINE_VERSION"{
  default = "8.0.23"
}

variable "RDS_DB_NAME"{
}

variable "RDS_DB_USERNAME"{
}

variable "RDS_PASSWORD"{
}

variable "AWS_VPC_ID" {
  type    = string
  default = "vpc-0d2831659ef89870c"
}