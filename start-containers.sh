#!/bin/bash
# ----------------- I used this script to run my containers from jenkins ------------------------------


# Define your custom network name
NETWORK_NAME="my-network"

# Stop and remove the existing containers
docker stop mongodb nodejs-app
docker rm mongodb nodejs-app

# Check if the custom network exists; create it if not
if ! docker network inspect "$NETWORK_NAME" &> /dev/null; then
  docker network create "$NETWORK_NAME"
fi

# Run the MongoDB container
docker run -d -p 27017:27017 --name mongodb -v mongodb-data:/data/db --network "$NETWORK_NAME" mongo:latest

# Build and run the Node.js container
docker build -t rivkyschon/nodejs-app:ci .
docker run -d -p 4000:4000 --name nodejs-app -v mongodb-data:/data/db --network "$NETWORK_NAME" rivkyschon/nodejs-app:ci
