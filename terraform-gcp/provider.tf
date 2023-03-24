terraform {
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "4.40.0"
      }
    }
}

provider "google" {
    project = "terraform-compute-381614"
    region = "asia-south1"
    zone = "asia-south1-a"
    credentials = "./cred/keys.json"
}
