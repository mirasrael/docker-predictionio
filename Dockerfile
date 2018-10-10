ARG PREDICTIONIO_VERSION=0.13.0
FROM alpine:latest

ARG PREDICTIONIO_VERSION

RUN mkdir /tmp/predictionio && \
 apk add --no-cache curl gnupg && \
 cd /tmp/predictionio && \
 curl http://mirror.linux-ia64.org/apache/predictionio/${PREDICTIONIO_VERSION}/apache-predictionio-${PREDICTIONIO_VERSION}-bin.tar.gz --output apache-predictionio-${PREDICTIONIO_VERSION}-bin.tar.gz && \
 apk add --no-cache gnupg && \
 curl https://www.apache.org/dist/predictionio/KEYS | gpg --import
 # gpg --verify apache-predictionio-${PREDICTIONIO_VERSION}-bin.tar.gz.asc apache-predictionio-${PREDICTIONIO_VERSION}-bin.tar.gz && \
RUN cd /tmp/predictionio &&  \
 tar zxvf apache-predictionio-${PREDICTIONIO_VERSION}-bin.tar.gz

RUN apk add --no-cache python3 && \
    curl https://bootstrap.pypa.io/get-pip.py | python3 && \
    pip install setuptools && \
    pip install --upgrade pip && \
    pip install predictionio datetime

RUN mkdir -p /opt/predictionio && \
    mv /tmp/predictionio/PredictionIO-${PREDICTIONIO_VERSION} /opt/predictionio/${PREDICTIONIO_VERSION} && \
    ln -s /opt/predictionio/${PREDICTIONIO_VERSION} /opt/predictionio/latest

RUN mkdir /opt/predictionio/latest/vendors && \
    curl http://d3kbcqa49mib13.cloudfront.net/spark-2.1.1-bin-hadoop2.6.tgz --output /tmp/spark-2.1.1-bin-hadoop2.6.tgz
    
RUN tar zxvf /tmp/spark-2.1.1-bin-hadoop2.6.tgz -C /opt/predictionio/latest/vendors

# RUN 
