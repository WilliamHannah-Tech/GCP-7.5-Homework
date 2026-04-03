#traveler: A firewall rule so port 80 can sing to the world.
resource "google_compute_firewall" "traveler_allow_http" {
  name    = "traveler-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags  = ["traveler-web"]
}


#traveler: The compute instance—your first reproducible node.
resource "google_compute_instance" "traveler_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {} # External IP
  }

  metadata = {
    #traveler: The banner is identity. Make it yours.
    student_name = var.student_name
  }

  metadata_startup_script = file("./startup_script.sh")

  tags = ["traveler-web"]

lifecycle {
    replace_triggered_by = [
      terraform_data.startup_script_version
    ]
  }
}

resource "terraform_data" "startup_script_version" {
  input = file("./startup_script.sh")
}

#traveler: Outputs are how automation speaks to other automation.
output "vm_external_ip" {
  value = google_compute_instance.traveler_vm.network_interface[0].access_config[0].nat_ip
}

output "vm_url" {
  value = "http://${google_compute_instance.traveler_vm.network_interface[0].access_config[0].nat_ip}"
}