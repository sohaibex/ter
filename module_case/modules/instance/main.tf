//IASS TO GCP
resource "google_compute_instance" "vm_instance" {
  machine_type = var.instance_type
  name         = var.instance_name

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        "my_label" = "value"
      }
    }
  }

  //ssh key 
  metadata = {
    ssh-keys = "sohaibex:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICjMVWYiTvPhexZ+n0648pDJXV6/Py0SQ1PYEn4bVVTg sohaibex"
  }
  //create network


  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

}
resource "google_compute_network" "vpc_network" {
  name = var.network_name
}
# create subnetwork
# resource "google_compute_subnetwork" "default" {
#   name          = "my-subnetwork"
#   ip_cidr_range = "10.0.10.0/26"
#   region        = "us-central1"
#   network       = google_compute_network.vpc_network.id
# }


//allow ssh firewall rule
resource "google_compute_firewall" "default" {
  name     = "allow-ssh-${var.instance_name}"
  network  = google_compute_network.vpc_network.name
  priority = 100


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_tags   = ["ssh"]
  source_ranges = ["0.0.0.0/0"]
}
