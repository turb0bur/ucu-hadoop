# Spark WordCount Application

This project provides a simple WordCount application built with PySpark to count the frequency of words in a text file.

The application is based on the [official Apache Spark WordCount example](https://github.com/apache/spark/blob/master/examples/src/main/python/wordcount.py).

## Project Structure

```
.
├── docker-compose.yaml  # Docker Compose configuration
├── Dockerfile           # Docker image definition
├── requirements.txt     # Python dependencies
├── wordcount.py         # PySpark WordCount application
└── README.md            # This file
```

In the Docker container, files are organized as follows:
```
/apps/                   # Application directory with scripts
└── wordcount.py         # WordCount application
/files/                  # Files directory for input data
└── example.txt          # Example text file (copy of README.md)
```

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Build and start the Spark cluster:

```bash
docker-compose up -d --build
```

The `-d` parameter runs containers in detached mode (in the background). If you want to see the container logs in real-time, you can omit this parameter:

```bash
docker-compose up --build
```

2. This will start a Spark master and worker node.

3. Access the Spark Web UI at http://localhost:8088

## Running the WordCount Application

The WordCount application takes a text file as input and counts the occurrences of each word.

1. To run the application and see the output, you can use:

```bash
docker exec spark-master spark-submit /apps/wordcount.py /files/your_input_file.txt
```

2. Replace `/files/your_input_file.txt` with the path to your input file (must be accessible inside the container).

3. For a quick test, you can use the included example file:

```bash
docker exec spark-master spark-submit /apps/wordcount.py /files/example.txt
```

This example.txt file is a copy of this README.md, which is included in the Docker image as a sample text file to process.

## Configuration

- The Spark cluster consists of a master node (`spark-master`) and a worker node (`spark-worker`)
- Worker memory is configurable via environment variable:
  ```bash
  SPARK_WORKER_MEMORY=6G docker-compose up -d --build
  ```
- Default worker memory is 4GB if not specified
- The worker node is configured with 2 cores
- Application files are mounted to `/apps` in the containers
- The `/files` directory contains example files for testing

## Customization

- Modify `requirements.txt` to add additional Python dependencies
- Adjust cores settings in `docker-compose.yaml` if needed
- Customize the Spark configuration in `docker-compose.yaml`
- Add your own example files to the Docker image by modifying the Dockerfile

## Stopping the Cluster

To stop the Spark cluster:

```bash
docker-compose down
``` 