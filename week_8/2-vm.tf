resource "google_compute_instance" "city-vm01" {
  name         = "city-vm01"
  machine_type = "n4-standard-2"
  zone         = "us-west1-b"

  tags = ["danger-web"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-stream-10"
      size  = 100
    }
  }

  network_interface {
    network    = google_compute_network.danger_zone.name
    subnetwork = google_compute_subnetwork.detroit.name

    access_config {}
  }

  metadata_startup_script = file("startup.sh")
}