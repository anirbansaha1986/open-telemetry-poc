resource "google_service_account" "default" {
    account_id = "108684237672254412723"
    display_name = "terraform-compute-service-acc"
}

resource "google_compute_instance" "terraform-compute-vm" {
  name = "vm-from-terraform"
  machine_type = "e2-standard-2"
  zone = "asia-south1-a"
  boot_disk {
    initialize_params {
        image = "debian-cloud/debian-11"
        labels = {
        my_label = "value"
        }
    }
  }
  metadata_startup_script = data.template_file.default.rendered
  network_interface {
    network = "default"
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}




