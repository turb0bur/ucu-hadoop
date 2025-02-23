# Hadoop Learning Project
This project contains Terraform configurations to deploy a Google Cloud Dataproc cluster with associated resources.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)

## Introduction
This project is a learning exercise to deploy a Hadoop cluster on Google Cloud Platform using Terraform. 
The configuration creates:
- A Dataproc cluster with customizable master and worker nodes
- A GCS bucket for cluster staging and data storage
- Predefined storage folders for Hive, Spark, and MapReduce

## Prerequisites

- **Terraform** installed (version 1.10+)
- **Google Cloud SDK** installed
- **GCP project** with required APIs enabled:
  - Dataproc API
  - Cloud Storage API
- Appropriate GCP credentials configured

## Installation
Clone the Repository
```bash
git clone https://github.com/turb0bur/ucu-hadoop
cd ucu-hadoop
```

## Usage
1. Export GCP credentials:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="<path_to_gcp_creds_file>.json"
```

2. Initialize Terraform:
```bash
cd terraform
terraform init
```

3. Create a terraform workspace:
I use convention `region-environment` for workspace names. For example, `usc1-staging` for a staging environment in the `us-central1` region.
```bash
terraform workspace new usc1-staging
```

4. Review the deployment plan:
Change corresponding workspace variables file in `workspaces/usc1-staging.tfvars` file if needed.
```bash
terraform plan --var-file=workspaces/usc1-staging.tfvars 
```

5. Apply the deployment plan:
```bash
terraform apply --var-file=workspaces/usc1-staging.tfvars
```

6. Destroy the deployment after use:
```bash
terraform destroy --var-file=workspaces/usc1-staging.tfvars
```
