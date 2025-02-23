variable "owner" {
  description = "The owner of the infrastructure"
  type        = string
  default     = "volodymyr-butko"
}

variable "project_id" {
  description = "Your GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-central2-a"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "hadoop_cluster" {
  description = "Hadoop cluster configuration"
  type = object({
    type                     = string
    version                  = string
    enable_component_gateway = bool
    optional_components      = list(string)
    master = object({
      machine_type = string
      disk_size_gb = number
    })
    worker = object({
      machine_type = string
      disk_size_gb = number
      count        = number
    })
    lifecycle_config = object({
      idle_delete_ttl = string
    })
  })
}