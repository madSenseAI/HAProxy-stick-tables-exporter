#!/usr/bin/env bash

source ../activate.sh

TAG="v2"

# 1. Vars
REGISTRY=ms-docker-registry
REPO=haproxy-stick-tables-exporter

# 2. Login to DigitalOcean Container Registry
doctl registry login

docker buildx create --use
docker buildx inspect --bootstrap

# 3. Build your image
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t registry.digitalocean.com/$REGISTRY/$REPO:$TAG \
  --push .
