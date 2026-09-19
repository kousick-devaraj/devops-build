#!/bin/bash
IMAGE_NAME=$1
if [ -z "$IMAGE_NAME" ]; then
  echo "Usage: ./deploy.sh <image-name:tag>"
  exit 1
fi
echo "Deploying Docker image: $IMAGE_NAME..."
export DOCKER_IMAGE=$IMAGE_NAME
docker compose down
docker compose up -d
