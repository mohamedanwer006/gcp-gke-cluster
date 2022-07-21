resource "google_compute_instance" "bastion" {
  depends_on   = [module.network]
  name         = "bastion-vm"
  machine_type = var.machine_type
  zone         = "${var.region}-a"

  tags = ["bastion-vm"]

  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }

  network_interface {
    network    = module.network.network_name
    subnetwork = module.network.management_subnet_name
    # comment to disable assignment of public ip
    # access_config {
    #   // Ephemeral public IP
    # }

  }

  labels = {
    "name" = "private-vm"
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  yum install -y tinyproxy
  echo "Allow localhost"| tee -a /etc/tinyproxy/tinyproxy.conf
  systemctl restart tinyproxy
  EOF
}
