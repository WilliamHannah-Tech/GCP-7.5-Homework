
output "internal_ip" {
  value = google_compute_instance.city-vm01.network_interface[0].network_ip
}

output "external_ip" {
  value = google_compute_instance.city-vm01.network_interface[0].access_config[0].nat_ip
}

output "name" {
  value = google_compute_instance.city-vm01.name
}

output "id" {
  value = google_compute_instance.city-vm01.id
}

output "self_link" {
  value = google_compute_instance.city-vm01.self_link
}

output "ip_address" {
  value = google_compute_instance.city-vm01.network_interface[0].network_ip
}

output "ip_addresses" {
  value = google_compute_instance.city-vm01.network_interface[0].access_config[0].nat_ip
}   
