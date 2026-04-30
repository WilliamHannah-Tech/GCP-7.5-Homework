#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "bluemoon" {
  project                 = var.project
  name                    = "bluemoon"
  auto_create_subnetworks = true
  mtu                     = 1460
}
