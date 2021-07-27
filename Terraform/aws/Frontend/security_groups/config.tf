variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type = string
}

variable "frontend_sg_ingress_rules_lb" {
    description = "List of inbound rules for Frontend Load Balancer"

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