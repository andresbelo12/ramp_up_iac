variable "AWS_KEY_PAIR_NAME"{
    description = "Name of the key pair for Frontend instances. This will be automatically set up"
    type = string
}

variable "BACKEND_SG_ID"{
    description = "ID of the Security Group for Frontend instances. This will be automatically set up"
    type = string
}

variable "BACKEND_AMI_ID"{
    description = "ID of the OS Image for the instances"
    type = string
    default = "ami-0d382e80be7ffdae5"
}

variable "BACKEND_INSTANCE_TYPE"{
    description = "Name of the instance type for all the machines"
    type = string
    default = "t2.micro"
}