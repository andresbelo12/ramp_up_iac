variable "FRONTEND_SG_ID"{
    description = "ID of the Security Group for Frontend instances. This will be automatically set up"
    type = string
}

variable "FRONTEND_TG_ARN"{
  description = "ARN of the Target Group that the load balancer will target"
  type = string
}

variable "public0_subnet_id"{
  description = "ID of the first subnet where the load balancer will be available"
  type = string
}

variable "public1_subnet_id"{
  description = "ID of the second subnet where the load balancer will be available"
  type = string
}

variable "FRONT_LB_LISTENER_PORT"{
  description = "Port where the load balancer will receive petitions"
  type = string
  default = "80"
}

variable "FRONT_LB_LISTENER_PROTOCOL"{
  description = "Type of petitions that will the listener receive"
  type = string
  default = "HTTP"
}