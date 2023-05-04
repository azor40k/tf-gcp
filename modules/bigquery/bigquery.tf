resource "google_bigquery_dataset" "challenge-tf-gcp-bq-dataset" {
    dataset_id                  = "project_bq_dataset"
    friendly_name               = "bq_dataset"
    location                    = var.location
    default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "challenge-tf-gcp-sheet" {
  dataset_id = google_bigquery_dataset.challenge-tf-gcp-bq-dataset.dataset_id
  table_id   = "challenge-tf-gcp-sheet"

  external_data_configuration {
    autodetect    = true
    source_format = "GOOGLE_SHEETS"

    google_sheets_options {
      skip_leading_rows = 1
    }

    source_uris = [
      "https://docs.google.com/spreadsheets/d/1WQKXG8Bsdo5Lr5ftNjKsUFWEn2_7UJEPBN4QyMj_E7A",
    ]
  }
}