terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.85.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "my-project-rahul-353815"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}

resource google_storage_bucket "GCS1"{
  name = "bucket-from-tf-using-rtkoli2327"
}
