

resource "google_compute_firewall" "allow_http" {
  name    = "danger-allow-http"
  network = google_compute_network.danger_zone.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["danger-web"]
}


resource "google_compute_firewall" "allow_ssh" {
  name    = "danger-allow-ssh"
  network = google_compute_network.danger_zone.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["danger-web"]
}