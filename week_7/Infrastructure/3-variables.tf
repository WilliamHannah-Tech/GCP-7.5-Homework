variable "project" {
  description = "The GCP project ID where infrastructure will be created"
  default     = "whannah-75-gcp"
}

variable "region" {
  description = "Region that the VPC lives in"
  default     = "us-central1"
}
