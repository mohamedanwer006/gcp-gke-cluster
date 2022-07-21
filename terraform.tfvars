# -------------------------- project specific vars ----------

region     = "us-central1"
project_id = "anwer-gcp"

# --------------------- subnets cidr ------------------------

management_subnet_cidr = "10.0.0.0/24"
restricted_subnet_cidr = "10.0.1.0/24"

# --------------------- vm configuration --------------------

machine_image = "centos-cloud/centos-7"
machine_type  = "e2-micro"

# --------------------- kubernetes configuration ------------

 pods_ipv4_cidr_block = "10.48.0.0/14"

 services_ipv4_cidr_block= "10.52.0.0/20"

 node_machine_type = "e2-small"


