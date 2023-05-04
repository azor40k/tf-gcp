##INIT STORAGE BUCKET
resource "google_storage_bucket" "challenge-tf-gcp-storage-bucket" {
  name  = "challenge-tf-gcp-storage-bucket"
  location = var.location
  force_destroy = true
  uniform_bucket_level_access = true
  
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}