project_id  = "ucu-hadoop"
region      = "us-central1"
environment = "staging"
zone        = "us-central1-a"
hadoop_cluster = {
  type                     = "standard"
  version                  = "1.5-debian10"
  enable_component_gateway = true
  optional_components = [
    "ZEPPELIN"
  ]
  master = {
    machine_type = "e2-standard-4"
    disk_size_gb = 50
  }
  worker = {
    machine_type = "e2-standard-4"
    disk_size_gb = 50
    count        = 2
  }
  lifecycle_config = {
    idle_delete_ttl = "3600s"
  }
}