

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check
# Resource: Global Health Check
resource "google_compute_health_check" "lb-health-check" {
  name                = "lb-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/"
    port         = 80
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service
# Resource: Global Backend Service
resource "google_compute_backend_service" "lb" {
  name                  = "lb-backend-service"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  health_checks         = [google_compute_health_check.lb-health-check.id]
  port_name             = "webserver"
  # Backend referes to TF 10

}
#   #Region A
#   backend {
#     group                 = google_compute_region_instance_group_manager.app-mig.instance_group
#     capacity_scaler       = 1.0
#     balancing_mode        = "RATE"
#     max_rate_per_instance = 3
#   }
# }

# #Region B
#  backend {
#     group           = google_compute_region_instance_group_manager.region_b.instance_group
#     capacity_scaler = 1.0
#     balancing_mode  = "RATE"
#     max_rate_per_instance = 3
#   }
# }
