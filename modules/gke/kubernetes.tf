resource "google_container_cluster" "gke_cluster" {
  name     = "gke-cluster"
  location = "${var.region}-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network_name
  subnetwork = var.subnetwork_name

  logging_service    = "logging.googleapis.com/kubernetes" # enable logging service
  monitoring_service = "monitoring.googleapis.com/kubernetes" # enable monitoring service

  networking_mode = "VPC_NATIVE"

  addons_config {
    # disable load balancer if you  use custom  ingress controller  
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
    }

  workload_identity_config {
    workload_pool = format("%s.svc.id.goog", var.project_id)
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }

master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.master_authorized_networks_cidr
      display_name = "External Control Plane access"
    }
  }

  private_cluster_config {
    enable_private_endpoint = true // set to true to connect to cluster from bastion only
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

