# Use a base image with Java as Spark requires Java
FROM openjdk:8-jdk

# Environment variables
ENV SPARK_VERSION=3.1.1
ENV HADOOP_VERSION=3.2
ENV SPARK_HOME=/spark

# Install Spark
RUN apt-get update && \
    apt-get install -y curl && \
    mkdir -p "${SPARK_HOME}" && \
    curl -fSL "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" | tar --strip-components=1 -xz -C "${SPARK_HOME}"

# Add Spark to PATH
ENV PATH=$SPARK_HOME/bin:$PATH

# Expose the Spark UI port
EXPOSE 4040

# Run Spark by default
CMD ["spark-shell"]