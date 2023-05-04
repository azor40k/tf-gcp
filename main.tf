terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

module "storage" {
  source     = "./modules/storage"
}

module "cloud" {
  source     = "./modules/cloud"
}

module "bigquery" {
  source     = "./modules/bigquery"
}