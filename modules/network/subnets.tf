# ----------------------- subnets -----------------------

resource "google_compute_subnetwork" "management_subnet" {
  name                     = "management-subnet"
  private_ip_google_access = true
  region                   = var.region
  network                  = google_compute_network.vpc_network.name
  ip_cidr_range            = var.management_subnet_cidr
}


resource "google_compute_subnetwork" "restricted_subnet" {
  name                     = "restricted-subnet"
  private_ip_google_access = true
  region                   = var.region
  purpose                  = "PRIVATE"
  network                  = google_compute_network.vpc_network.name
  ip_cidr_range            = var.restricted_subnet_cidr
}
