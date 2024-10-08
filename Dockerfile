FROM apache/airflow:2.9.2-python3.11
#FROM docker-airflow-spark:latest


USER root
# Install OpenJDK-17
RUN apt-get update \
  && apt -y install openjdk-17-jdk \
  && apt-get autoremove -yqq --purge \
  && apt-get clean

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64

USER airflow

RUN pip install apache-airflow apache-airflow-providers-apache-spark pyspark==3.5.1 clickhouse-driver clickhouse-sqlalchemy