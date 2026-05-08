resource "google_compute_network" "danger_zone" {
  project                = "whannah-gcp-75"  
  name                    = "danger-zone"
  auto_create_subnetworks = true
  mtu                     = 1460
}

resource "google_compute_subnetwork" "detroit" {
  name          = "detroit"
  ip_cidr_range = "10.40.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.danger_zone.id
  private_ip_google_access = false
}

