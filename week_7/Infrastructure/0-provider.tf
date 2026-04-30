#https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/version_5_upgrade

terraform {
  required_providers {
    google = {
      version = "~> 5.0.0"
    }
  }
}

provider "google" {
  project = var.project //Ensure the correct project is entered here!!!
  region  = var.region
}
