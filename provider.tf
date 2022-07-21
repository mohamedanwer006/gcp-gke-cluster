terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.28.0"
    }
  }
  backend "gcs" {
   bucket  = "gcp-terrafrom-statefile-006"
   prefix  = "terraform/state"
 }
}



provider "google" {
  # Configuration options
    project     = "anwer-gcp"
    region      = "us-central1"
    zone   = "us-central1-c"
    credentials = "/home/mohamed/.config/gcloud/application_default_credentials.json"

}


