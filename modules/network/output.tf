
output "network_name" {
    value = google_compute_network.vpc_network.name
}

output "restricted_subnet_name" {
    value = google_compute_subnetwork.restricted_subnet.name
}

output "management_subnet_name" {
    value = google_compute_subnetwork.restricted_subnet.name
}
