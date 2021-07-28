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

variable "private0_subnet_id"{
    description = "ID of the first private subnet used for Bastion infrastructure"
    type        = string
    default     = "subnet-0d74b59773148d704"
}

variable "private1_subnet_id"{
    description = "ID of the second private subnet used for Bastion infrastructure"
    type        = string
    default     = "subnet-038fa9d9a69d6561e"
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
# Variables for Auto Scaling Group             #
################################################

variable "ASG_MAX_SIZE"{
    description = "Amount of max desired machines in the auto scaling group"
    default     = 5
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

variable "PORT"{
    description = "Port where the backend application will be launched"
    type        = string
    default     = "3000"
}

variable "BACKEND_AMI_ID"{
    description = "ID of the OS Image for the instances"
    type        = string
    default     = "ami-0d382e80be7ffdae5"
}

variable "BACKEND_INSTANCE_TYPE"{
    description = "Name of the instance type for all the machines"
    type        = string
    default     = "t2.micro"
}

################################################
# Variables for Load Balancer                  #
################################################

variable "BACK_LB_LISTENER_PORT"{
    description = "Port where the load balancer will receive petitions"
    type        = string
    default     = "3000"
}

variable "BACK_LB_LISTENER_PROTOCOL"{
    description = "Type of petitions that will the listener receive"
    type        = string
    default     = "HTTP"
}

################################################
# Variables for Security Groups                #
################################################

variable "BASTION_IP"{
    description	=	"Public IP of the machine enabled to SSH with private instances"
		type				=	string
}

variable "backend_sg_ingress_rules_lb" {
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
          from_port   = 3000
          to_port     = 3000
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "Rule for SSH connection from admin IP for Backend Instances"
        },
        
    ]
}

################################################
# Variables for Target Groups                  #
################################################

variable "TG_BACK_PORT"{
    description = "Port where the petitions will be forwarded in the Bastion machines"
    type        = string
    default     = "3000"
}

variable "TG_BACK_PROTOCOL"{
    description = "Protocol of the petitions that will receive the target port"
    type        = string
    default     = "HTTP"
}

variable "TG_HC_BACK_PATH"{
    description = "Path where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "/"
}

variable "TG_HC_BACK_PORT"{
    description = "Port where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "3000"
}

variable "TG_HC_BACK_PROTOCOL"{
    description = "Protocol of the port where the health checker will check the avaibility of the target group machines"
    type        = string
    default     = "HTTP"
}

variable "TG_HC_BACK_MATCHER"{
    description = "HTTP Responses that will accept the health checker"
    type        = string
    default     = "200-499"
}