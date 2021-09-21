provider "google" {
  project     = local.project
}

resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}

output "id" {
   value = google_compute_instance.default.id
}
