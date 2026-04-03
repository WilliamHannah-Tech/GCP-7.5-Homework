variable "project_id" {
  description = "whannah-gcp-75"
  type        = string
}

variable "region" {
  #traveler: Iowa. Corn. Clouds. Infrastructure.
  type    = string
  default = "us-central1"
}

variable "zone" {
  #traveler: A single node awakens here.
  type    = string
  default = "us-central1-a"
}

variable "student_name" {
  #traveler: Your deploy banner. Own your work.
  type    = string
  default = "william"
}

variable "vm_name" {
  type    = string
  default = "traveler-node-lab2"
}