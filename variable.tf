# -------------------------------------------------------#

variable "region" {
  default = "us-central1"
  type    = string
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

# --------------------- vm configuration ----------------

variable "machine_image" {
  default = "centos-cloud/centos-7"
  type    = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

# --------------------- kubernetes cluster --------------

variable "pods_ipv4_cidr_block" {
  type    = string
  default = "10.48.0.0/14"
}
variable "services_ipv4_cidr_block" {
  type    = string
  default = "10.52.0.0/20"
}
variable "node_machine_type" {
    type = string
    default = "e2-small"
}