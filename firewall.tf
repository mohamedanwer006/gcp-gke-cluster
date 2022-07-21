# -------------------------- Firewall ---------------------------------


# allow ssh to private instances
resource "google_compute_firewall" "fw_allow_ssh" {
  depends_on = [module.network]

  name    = "fw-allow-ssh"
  network = module.network.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "icmp"
  }

  # Allow traffic from google IAP to instances in the restricted subnet

  source_ranges = ["35.235.240.0/20"] // allow only from the IAP
#    source_ranges = ["0.0.0.0/0"] // allow from anywhere
  target_tags   = ["bastion-vm"]
}

