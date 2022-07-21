# ----------------------------- network ----------------------- 
resource "google_compute_network" "vpc_network" {
  name                            = "vpc-network"
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = false
}



