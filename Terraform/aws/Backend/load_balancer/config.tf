variable "BACKEND_SG_ID"{
    description = "ID of the Security Group for Frontend instances. This will be automatically set up"
    type = string
}

variable "BACKEND_TG_ARN"{
  description = "ARN of the Target Group that the load balancer will target"
  type = string
}

variable "private0_subnet_id"{
  description = "ID of the first subnet where the load balancer will be available"
  type = string
}

variable "private1_subnet_id"{
  description = "ID of the second subnet where the load balancer will be available"
  type = string
}

variable "BACK_LB_LISTENER_PORT"{
  description = "Port where the load balancer will receive petitions"
  type = string
  default = "80"
}

variable "BACK_LB_LISTENER_PROTOCOL"{
  description = "Type of petitions that will the listener receive"
  type = string
  default = "HTTP"
}