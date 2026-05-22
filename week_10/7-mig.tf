
resource "google_compute_region_instance_group_manager" "app-mig" {
  name               = "app-mig"
  target_size        = 2
  base_instance_name = "dirty-glove-template"
  region             = "us-central1"
  #region = "" (optional if provider default is set)


  # Instance Template
  version {
    instance_template = google_compute_instance_template.dirty-glove-template.id
  }

  # Named Port
  named_port {
    name = "webserver"
    port = 80
  }

  # Autohealing Config
  auto_healing_policies {
    health_check      = google_compute_health_check.lb-health-check.id
    initial_delay_sec = 300
  }
}
