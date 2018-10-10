#!/usr/bin/env bash
PREDICTIONIO_VERSION=0.13.0
docker build --build-arg PREDICTIONIO_VERSION=$PREDICTIONIO_VERSION --tag mirasrael/predictionio:$PREDICTIONIO_VERSION .
