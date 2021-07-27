variable "FRONTEND_TG_ARN"{
  description = "ARN of the Target Group that will target this scaling group"
  type = string
}

variable "public0_subnet_id"{
  description = "ID of the first subnet where the auto scaling group will be deployed"
  type = string
}

variable "public1_subnet_id"{
  description = "ID of the second subnet where the auto scaling group will be deployed"
  type = string
}

variable "FRONTEND_LAUNCH_TEMPLATE_ID"{
  description = "ID of the Launch Template used for launching all the machines in the Frontend ASG"
  type = string
}

variable "ASG_MAX_SIZE"{
  description = "Amount of max desired machines in the auto scaling group"
  default = 5
}

variable "ASG_MIN_SIZE"{
  description = "Amount of min desired machines in the auto scaling group"
  default = 1
}

variable "ASG_DESIRED_CAPACITY"{
  description = "Amount of desired machines in the auto scaling group"
  default = 2
}