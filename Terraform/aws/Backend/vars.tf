variable "AWS_KEY_PAIR_NAME" {
    description = "Name of the key pair for Frontend instances. This will be automatically set up"
    type = string
}

variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type = string
}

variable "private0_subnet_id"{
    description = "ID of the first private subnet used for Frontend infrastructure"
    type = string
    default = "subnet-0088df5de3a4fe490"
}

variable "private1_subnet_id"{
    description = "ID of the second private subnet used for Frontend infrastructure"
    type = string
    default = "subnet-055c41fce697f9cca"
}
