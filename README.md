# Hadoop Learning Project
This project contains Terraform configurations to deploy a Google Cloud Dataproc cluster with associated resources.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Subprojects](#subprojects)

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

3. Create or select a terraform workspace:
I use convention `region-environment` for workspace names. For example, `usc1-staging` for a staging environment in the `us-central1` region.
```bash
terraform workspace list
terraform workspace select usc1-staging || terraform workspace new usc1-staging
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

## Subprojects

This repository contains several subprojects for different Big Data technologies:

### Terraform
- **Location**: [terraform/](terraform/)
- **Description**: Contains Terraform configurations for deploying a Google Cloud Dataproc cluster and associated resources.

### Hive
- **Location**: [hive/](hive/)
- **Description**: Contains Hive projects using Apache Zeppelin notebooks for movie data analysis.
- **Documentation**: [hive/README.md](hive/README.md)

### Spark
- **Location**: [spark/](spark/)
- **Description**: Contains Spark projects for various data processing tasks.
- **Subprojects**:
  - **WordCount**: A PySpark WordCount application with Docker configuration for local development.
  - **RDD Movie Analysis**: [spark/rdd/](spark/rdd/) - Analyzes MovieLens dataset using Spark RDD API.
  - **SQL Movie Analysis**: [spark/sql/](spark/sql/) - Analyzes MovieLens dataset using Spark SQL and DataFrame API.
- **Documentation**: [spark/README.md](spark/README.md), [spark/rdd/README.md](spark/rdd/README.md), [spark/sql/README.md](spark/sql/README.md)
