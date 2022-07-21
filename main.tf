module "network" {
    source = "./modules/network"
    management_subnet_cidr = var.management_subnet_cidr
    restricted_subnet_cidr = var.restricted_subnet_cidr
    region = var.region
    project_id = var.project_id

    depends_on = [
      google_project_service.compute,
      google_project_service.container
    ]
}


module "gke" {
    source = "./modules/gke"
    region = var.region
    project_id = var.project_id
    network_name = module.network.network_name
    subnetwork_name = module.network.restricted_subnet_name
    master_authorized_networks_cidr = var.management_subnet_cidr
    depends_on = [
      module.network
    ] 
}