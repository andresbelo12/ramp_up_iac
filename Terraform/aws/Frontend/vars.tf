################################################
# Common Variables                             #
################################################

variable "AWS_KEY_PAIR_NAME" {
    description = "Name of the key pair for Bastion instances. This will be automatically set up"
    type        = string
}

variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type        = string
}

variable "public0_subnet_id"{
    description = "ID of the first public subnet used for Frontend infrastructure"
    type        = string
    default     = "subnet-0088df5de3a4fe490"
}

variable "public1_subnet_id"{
    description = "ID of the second public subnet used for Frontend infrastructure"
    type        = string
    default     = "subnet-055c41fce697f9cca"
}

################################################
# Variables for Auto Scaling Group             #
################################################

variable "ASG_MAX_SIZE"{
    description = "Amount of max desired machines in the auto scaling group"
    default     = 4
}

variable "ASG_MIN_SIZE"{
    description = "Amount of min desired machines in the auto scaling group"
    default     = 1
}

variable "ASG_DESIRED_CAPACITY"{
    description = "Amount of desired machines in the auto scaling group"
    default     = 2
}

################################################
# Variables for Launch Template                #
################################################

variable "BACK_HOST"{
    description = "Port where is the backend application running"
    type        = string
}

variable "FRONTEND_AMI_ID"{
    description = "ID of the OS Image for the instances"
    type        = string
    default     = "ami-0d382e80be7ffdae5"
}

variable "FRONTEND_INSTANCE_TYPE"{
    description = "Name of the instance type for all the machines"
    type        = string
    default     = "t2.micro"
}

################################################
# Variables for Load Balancer                  #
################################################

variable "FRONT_LB_LISTENER_PORT"{
    description = "Port where the load balancer will receive petitions"
    type        = string
    default     = "80"
}

variable "FRONT_LB_LISTENER_PROTOCOL"{
    description = "Type of petitions that will the listener receive"
    type        = string
    default     = "HTTP"
}

################################################
# Variables for Security Groups                #
################################################

variable "frontend_sg_ingress_rules_lb" {
    description = "List of inbound rules for Bastion Load Balancer"

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
          description = "Rule for HTTP connections for Frontend Load Balancer"
        },
        
    ]
}

variable "frontend_sg_ingress_rules" {
    description = "List of outbound rules for Bastion instances"

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
          description = "Rule for HTTP connections for Frontend Instances"
        },
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "10.1.0.14/32"
          description = "Rule for SSH connection from admin IP for Frontend Instances"
        },
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "54.151.74.181/32"
          description = "Rule for SSH connection from admin IP for Frontend Instances"
        },
    ]
}

################################################
# Variables for Target Groups                  #
################################################

variable "TG_FRONT_PORT"{
    description = "Port where the petitions will be forwarded in the Bastion machines"
    type        = string
    default     = "3030"
}

variable "TG_FRONT_PROTOCOL"{
    description = "Protocol of the petitions that will receive the target port"
    type        = string
    default     = "HTTP"
}

variable "TG_HC_FRONT_PATH"{
    description = "Path where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "/"
}

variable "TG_HC_FRONT_PORT"{
    description = "Port where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "3030"
}

variable "TG_HC_FRONT_PROTOCOL"{
    description = "Protocol of the port where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "HTTP"
}

variable "TG_HC_FRONT_MATCHER"{
    description = "HTTP Responses that will accept the health checker"
    type        = string
    default     = "200-499"
}