variable "AWS_KEY_PAIR" {
}

variable "security_group_id" {
    type = string
    default = "sg-0150ede99ff9e3fa4"
}

variable "vpc_id" {
  type = string
  default = "vpc-0d2831659ef89870c"
}

variable "public0_subnet_id" {
    type = string
    default = "subnet-0088df5de3a4fe490"
}

variable "public1_subnet_id" {
    type = string
    default = "subnet-055c41fce697f9cca"
}

variable "frontend_sg_ingress_rules_lb" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for SSH connection from admin IP for Frontend Instances"
        },
        
    ]
}

variable "frontend_sg_ingress_rules" {
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
          description = "Rule for SSH connection from admin IP for Frontend Instances"
        },
        {
          from_port   = 3030
          to_port     = 3030
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for HTTP connections to Frontend applications"
        },
    ]
}