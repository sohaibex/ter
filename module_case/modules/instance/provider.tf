terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.49.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "shaped-storm-374910"
  region  = "europe-central"
  zone    = "europe-central2-a"
}
