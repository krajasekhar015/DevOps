# mandatory (project_name & environment, User has to supply)
variable "project_name" {
    type = string
}

variable "environment" {
    type = string
  }

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
    default = true
}

# optional (common-tags & vpc_tags)
variable "common_tags" {
    default = {}
}

variable "vpc_tags" {
    default = {}
}