locals {
  resource_name = join("-", [var.region, var.environment, "%s", "%s"])
  bucket_name   = format(local.resource_name, "dataproc-bucket", random_string.bucket_suffix.result)
  cluster_name  = format(local.resource_name, "dataproc-cluster", random_string.bucket_suffix.result)
}