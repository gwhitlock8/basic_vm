provider "google" {
credentials = file("credentials.json")
project = "${var.project}"
region = "${var.region}"
zone = "${var.zone}"
}

resource "google_compute_network" "vpc_network" {
name = "terraform-network"
}
resource "google_compute_instance" "vm_instance" {
name = "${var.hostname}"
machine_type = "f1-micro"
zone = "${var.zone}"
boot_disk {
initialize_params {
image = "centos-cloud/centos-7"
}
}

network_interface {
network = google_compute_network.vpc_network.name
access_config {
}
}
}
