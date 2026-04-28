resource "google_compute_instance" "vm" {
  name         = "lab-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id

    # External IP for SSH (lab simplicity)
    access_config {}
  }

 metadata_startup_script = file("startup2.sh")

  tags = ["ssh", "http", "http-server"]
}
  
