################################################
# Common Variables                             #
################################################

variable "AWS_KEY_PAIR_NAME" {
    description = "Name of the key pair for Frontend instances. This will be automatically set up"
    type        = string
}

variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type        = string
}

variable "public0_subnet_id"{
    description	= "ID of the first public subnet used for Frontend infrastructure"
    type        = string
    default     = "subnet-0088df5de3a4fe490"
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

variable "RDS_HOST"{
    description = "Host of the RDS Instance"
    type        = string
}

################################################
# Variables for Bastion Instance               #
################################################

variable "BASTION_AMI_ID"{
    description = "ID of the OS Image for the instances"
    type        = string
    default     = "ami-0d382e80be7ffdae5" 
}

variable "BASTION_INSTANCE_TYPE"{
    description = "Name of the instance type for all the machines"
    type        = string
    default     = "t2.micro"
}

################################################
# Variables for Security Groups                #
################################################


variable "bastion_sg_ingress_rules" {
    description = "List of outbound rules for Bastion instances"

    type  = list(object({
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
          cidr_block  = "179.13.155.26/32"
          description = "Rule for SSH connection from admin IP for Bastion Instances"
        },
    ]
}