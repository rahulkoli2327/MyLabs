resource "google_compute_instance" "vm-from-tf" {
  name         = "myvm"
  machine_type = "n1-standard-2"
  zone         = "asia-southeast1-a"

  allow_stopping_for_update = true

  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }

  boot_disk{
    initialize_params {
      image = "debian-10-buster-v20220118"
      size = 20
      
    }
  }

  labels = {
    "env" = "tfgaytri"
  }
}


resource "google_compute_disk" "disk-1" {
  name = "disk-1"
  size = 30
  zone = "asia-southeast1-a"
  type = "pd-ssd"
  
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.disk-1.id
  instance = google_compute_instance.vm-from-tf.id
}
