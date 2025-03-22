FROM bitnami/spark:3.5.5

USER root

RUN apt-get update && \
    apt-get install -y python3-pip && \
    apt-get clean

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /apps

RUN mkdir -p /files

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY wordcount.py .
COPY README.md /files/example.txt

USER 1001

ENTRYPOINT ["/opt/bitnami/scripts/spark/entrypoint.sh"]
CMD ["/opt/bitnami/scripts/spark/run.sh"] 