FROM openjdk:8-alpine

LABEL version="0.1"
LABEL maintainer="helias.rodrigues@cloudscript.com.br"
LABEL description="Setup base image with Spark standalone implementation on Alpine Linux."

RUN apk --update add wget tar bash
RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.2/spark-2.4.2-bin-hadoop2.7.tgz

COPY start-master.sh /spark/
COPY start-worker.sh /spark/

RUN tar -xzf spark-2.4.2-bin-hadoop2.7.tgz && \
    mv spark-2.4.2-bin-hadoop2.7/* /spark && \
    rm spark-2.4.2-bin-hadoop2.7.tgz && \
    chmod +x /spark/start*
