variable "AWS_KEY_PAIR_NAME" {
    description = "Name of the key pair for Frontend instances. This will be automatically set up"
    type = string
}

variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type = string
}

variable "public0_subnet_id"{
    description = "ID of the first public subnet used for Frontend infrastructure"
    type = string
    default = "subnet-0088df5de3a4fe490"
}

variable "public1_subnet_id"{
    description = "ID of the second public subnet used for Frontend infrastructure"
    type = string
    default = "subnet-055c41fce697f9cca"
}
