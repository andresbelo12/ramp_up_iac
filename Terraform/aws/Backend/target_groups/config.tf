variable "AWS_VPC_ID"{
  description = "ID of the VPC to be used in the infrastructure"
  type = string
}

variable "TG_BACK_PORT"{
  description = "Port where the petitions will be forwarded in the Frontend machines"
  type = string
  default = "3030"
}

variable "TG_BACK_PROTOCOL"{
  description = "Protocol of the petitions that will receive the target port"
  type = string
  default = "HTTP"
}

variable "TG_HC_BACK_PATH"{
  description = "Path where the health checker will check the avaibility of the target group machines"
  type = string
  default = "/"
}

variable "TG_HC_BACK_PORT"{
  description = "Port where the health checker will check the avaibility of the target group machines"
  type = string
  default = "3030"
}

variable "TG_HC_BACK_PROTOCOL"{
  description = "Protocol of the port where the health checker will check the avaibility of the target group machines"
  type = string
  default = "HTTP"
}

variable "TG_HC_BACK_MATCHER"{
  description = "HTTP Responses that will accept the health checker"
  type = string
  default = "200-499"
}