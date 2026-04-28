resource "google_compute_router" "router" {
  name    = "router"
  region  = "us-central1"
  network = google_compute_network.main.id

  bgp {
    asn = 64514
  }

  depends_on = [
    google_compute_network.main
  ]
}


resource "google_compute_router" "router-king" {
  name    = "router-king"
  region  = "us-central1"
  network = google_compute_network.kingside.id

  bgp {
    asn = 65501
  }

  depends_on = [
    google_compute_network.kingside
  ]
}