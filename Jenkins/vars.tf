################################################
# Variables for provider and resources         #
################################################

variable "AWS_ACCESS_KEY" {
  description = "User access key for access to AWS"
  type        = string
}

variable "AWS_SECRET_KEY" {
  description = "User secret key for access to AWS"
  type        = string
}

variable "AWS_REGION" {
  description = "AWS Region where the infrestructure will be deployed"
  type        = string
  default     = "eu-west-1"
}

variable "PUBLIC_KEY" {
  description = "Public SSH key for key the key pair that will be used to access to all the instances"
  type        = string
}

variable "AWS_VPC_ID" {
  description = "ID of the VPC to be used in the infrastructure"
  type        = string
  default     = "vpc-0d2831659ef89870c"
}

################################################
# Variables for Jenkins Instance               #
################################################

variable "public0_subnet_id"{
    description = "ID of the first public subnet used for Jenkins infrastructure"
    type        = string
    default     = "subnet-0088df5de3a4fe490"
}

variable "JENKINS_INSTANCE_TYPE"{
    description = "Name of the instance type for all the machines"
    type        = string
    default     = "t2.micro"
}


################################################
# Variables for Security Groups                #
################################################

variable "jenkins_sg_ingress_rules" {
    description = "List of outbound rules for Frontend instances"

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
          cidr_block  = "179.13.155.26/32"
          description = "Rule for SSH connection from admin IP for Jenkins Instances"
        },
        {
          from_port   = 8080
          to_port     = 8080
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for HTTP connections for Jenkins Instances"
        },
        {
          from_port   = 50000
          to_port     = 50000
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for HTTP connections for Jenkins Instances"
        },
    ]
}