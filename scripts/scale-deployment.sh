#!/bin/bash

# Get the deployment name from the user
read -p "Enter the name of the deployment: " deployment_name

# Get the desired number of replicas from the user
read -p "Enter the desired number of replicas (0 to stop): " desired_replicas

# Use kubectl to scale the deployment
kubectl scale deployment "$deployment_name" --replicas="$desired_replicas"

# Check if the operation was successful
if [ $? -eq 0 ]; then
  echo "Deployment scaled to $desired_replicas replicas."
else
  echo "Failed to scale the deployment."
fi
