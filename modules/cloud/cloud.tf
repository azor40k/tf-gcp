#FIRST APPLY CMD
##FILE ARCHIVE SETUP
data "archive_file" "challenge-tf-gcp-archive" {
    type        = "zip"
    source_dir  = "./modules/cloud/function"
    output_path = "./tmp/function.zip"
}

##FILE OBJECT STORAGE
resource "google_storage_bucket_object" "challenge-tf-gcp-storage" {
    source       = data.archive_file.challenge-tf-gcp-archive.output_path
    content_type = "application/zip"

    name         = "${var.object_name}.zip"
    bucket       = var.bucket_name
}

#SECOND APPLY CMD
##CLOUD FUNCTION
resource "google_cloudfunctions_function" "challenge-tf-gcp-cloud-function" {
    project     = var.project_id
    name        = "challenge-tf-gcp-cloud-function"
    runtime     = "nodejs18"
    region      = var.region
    entry_point  = "helloGET"
    trigger_http = true
    source_archive_bucket = var.bucket_name
    source_archive_object = "${var.object_name}.zip"
}