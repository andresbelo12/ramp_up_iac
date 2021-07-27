variable "AWS_KEY_PAIR" {
}

variable "AWS_VPC_ID" {
}

variable "private0_subnet_id" {
    type = string
    default = "subnet-0d74b59773148d704"
}

variable "private1_subnet_id" {
    type = string
    default = "subnet-038fa9d9a69d6561e"
}

variable "backend_sg_ingress_rules_lb" {
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
          description = "Rule for SSH connection from admin IP for Backend Instances"
        },
        
    ]
}

variable "backend_sg_ingress_rules" {
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
          description = "Rule for SSH connection from admin IP for Backend Instances"
        },
        {
          from_port   = 3000
          to_port     = 3000
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for HTTP connections to Backend applications"
        },
    ]
}