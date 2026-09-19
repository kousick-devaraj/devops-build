#!/bin/bash
IMAGE_NAME=$1
if [ -z "$IMAGE_NAME" ]; then
  echo "Usage: ./build.sh <image-name:tag>"
  exit 1
fi
echo "Building Docker image: $IMAGE_NAME..."
docker build -t $IMAGE_NAME .
