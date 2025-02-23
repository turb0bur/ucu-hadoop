resource "random_string" "bucket_suffix" {
  length  = 7
  special = false
  upper   = false
}

resource "google_storage_bucket" "cluster_bucket" {
  name          = "${var.project_id}-staging"
  location      = var.region
  force_destroy = true

  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 14
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    name        = format(local.resource_name, "dataproc-bucket", random_string.bucket_suffix.result)
    environment = var.environment
    project     = var.project_id
    managed_by  = "terraform"
    owner       = var.owner
  }
}

resource "google_storage_bucket_object" "folders" {
  for_each = toset([
    "warehouse/",
    "spark-history/",
    "job-history/done/",
    "job-history/intermediate/"
  ])

  bucket  = google_storage_bucket.cluster_bucket.name
  name    = each.key
  content = " "
}