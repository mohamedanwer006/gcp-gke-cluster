# -------------------------------------------------------#

variable "region" {
  default = "us-central1"
  type    = string
}
variable "project_id" {
  type = string
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

variable "network_name" {
  type = string
}
variable "subnetwork_name" {
  type = string
}

variable "master_authorized_networks_cidr" {
  type = string
}