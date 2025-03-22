resource "google_dataproc_cluster" "hadoop_cluster" {
  name    = "${var.owner}-${formatdate("YYYYMMDD", timestamp())}"
  region  = var.region
  project = var.project_id

  cluster_config {
    staging_bucket = google_storage_bucket.cluster_bucket.name

    master_config {
      num_instances = 1
      machine_type  = var.hadoop_cluster.master.machine_type
      disk_config {
        boot_disk_size_gb = var.hadoop_cluster.master.disk_size_gb
      }
    }

    worker_config {
      num_instances = var.hadoop_cluster.worker.count
      machine_type  = var.hadoop_cluster.worker.machine_type
      disk_config {
        boot_disk_size_gb = var.hadoop_cluster.worker.disk_size_gb
      }
    }

    software_config {
      image_version       = var.hadoop_cluster.version
      optional_components = var.hadoop_cluster.optional_components

      override_properties = {
        "dataproc:dataproc.allow.zero.workers"              = "false"
        "hive:hive.metastore.warehouse.dir"                 = "gs://${google_storage_bucket.cluster_bucket.name}/warehouse"
        "spark:spark.history.fs.logDirectory"               = "gs://${google_storage_bucket.cluster_bucket.name}/spark-history"
        "spark:spark.eventLog.enabled"                      = "true"
        "spark:spark.eventLog.dir"                          = "gs://${google_storage_bucket.cluster_bucket.name}/spark-history"
        "mapred:mapreduce.jobhistory.done-dir"              = "gs://${google_storage_bucket.cluster_bucket.name}/job-history/done"
        "mapred:mapreduce.jobhistory.intermediate-done-dir" = "gs://${google_storage_bucket.cluster_bucket.name}/job-history/intermediate"
      }
    }

    endpoint_config {
      enable_http_port_access = var.hadoop_cluster.enable_component_gateway
    }

    gce_cluster_config {
      service_account_scopes = [
        "https://www.googleapis.com/auth/bigquery",
        "https://www.googleapis.com/auth/bigtable.admin.table",
        "https://www.googleapis.com/auth/bigtable.data",
        "https://www.googleapis.com/auth/cloud.useraccounts.readonly",
        "https://www.googleapis.com/auth/devstorage.full_control",
        "https://www.googleapis.com/auth/devstorage.read_write",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring.write",
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  }

  labels = {
    name        = format(local.resource_name, "dataproc-cluster", formatdate("YYYYMMDD", timestamp()))
    environment = var.environment
    project     = var.project_id
    managed_by  = "terraform"
    owner       = var.owner
  }

  depends_on = [
    google_storage_bucket.cluster_bucket,
  ]
}
