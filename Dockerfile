ARG PREDICTIONIO_VERSION=0.12.0
FROM steveny/predictionio:$PREDICTIONIO_VERSION

ARG PREDICTIONIO_VERSION

RUN (echo predict; echo predict; echo y) | adduser predictionio
RUN chown -R predictionio:root /PredictionIO-${PREDICTIONIO_VERSION}-incubating

RUN apt-get update -y && apt-get install -y \
   git \
   sudo
RUN usermod -a -G sudo predictionio
RUN echo "predictionio ALL=NOPASSWD: ALL" >> /etc/sudoers

USER predictionio
RUN pip install setuptools
RUN pip install --upgrade pip
RUN sudo pip install predictionio datetime


