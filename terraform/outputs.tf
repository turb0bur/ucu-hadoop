output "cluster_name" {
  description = "Name of the created Dataproc cluster"
  value       = google_dataproc_cluster.hadoop_cluster.name
}

output "master_instance" {
  description = "Master node instance details"
  value = {
    hostname    = google_dataproc_cluster.hadoop_cluster.cluster_config[0].master_config[0].instance_names[0]
    zone        = var.zone
    ssh_command = "gcloud compute ssh ${google_dataproc_cluster.hadoop_cluster.cluster_config[0].master_config[0].instance_names[0]} --zone=${var.zone} --project=${var.project_id}"
  }
}

output "worker_instances" {
  description = "List of worker node instance names"
  value       = google_dataproc_cluster.hadoop_cluster.cluster_config[0].worker_config[0].instance_names
}

output "component_gateway_endpoint" {
  description = "The endpoint for component gateway services"
  value = format(
    "https://%s-dp.%s.dataproc.googleusercontent.com",
    google_dataproc_cluster.hadoop_cluster.name,
    var.region
  )
  sensitive = true
}