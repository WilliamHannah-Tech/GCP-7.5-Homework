

resource "google_compute_region_autoscaler" "app-region-autoscaler" {
  name   = "app-region-autoscaler"
  region = "us-central1"
  target = google_compute_region_instance_group_manager.app-mig.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60


    cpu_utilization {
      target = 0.5
    }
  }
}
