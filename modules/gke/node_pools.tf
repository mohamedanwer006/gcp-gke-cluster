

resource "google_container_node_pool" "node_pool" {
    
  name           = "node-pool"
  cluster        = google_container_cluster.gke_cluster.id

  node_count     = 1

  autoscaling {
    max_node_count = 3
    min_node_count = 1
  }
  max_pods_per_node = 110

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false # like spot instances
    machine_type = var.node_machine_type
    disk_size_gb = 10

    service_account = google_service_account.kubernetes_sa.email

#  limit access through IAM roles on node service accounts
    oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      cluster = google_container_cluster.gke_cluster.name
    }
  }


  depends_on = [
    google_container_cluster.gke_cluster
  ]
}
