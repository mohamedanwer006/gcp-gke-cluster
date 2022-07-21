# -------------------------------------------------------#

variable "region" {
  default = "us-central1"
  type    = string
  description = "default us-central1 "
}
variable "project_id" {
  type = string
}

# --------------------- subnets cidr --------------------

variable "management_subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}
variable "restricted_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
