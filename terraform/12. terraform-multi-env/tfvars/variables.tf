variable  "instances" {
  type        = map
}

variable "domain_name" {
  default = "krajasekhar015.cloud"
}

variable "zone_id" {
  default = "Z095149226F3M5EY27U7V"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
    }
}

variable "tags" {
    type = map
}

variable "environment" {
}