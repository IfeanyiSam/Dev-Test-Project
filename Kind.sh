#!/bin/bash

# Define the name of your Kind cluster
CLUSTER_NAME="test-cluster"

# Check if the cluster already exists
if kind get clusters | grep -q "$CLUSTER_NAME"; then
  echo "Cluster '$CLUSTER_NAME' already exists. Skipping creation."
else
  # Create a Kind cluster
  kind create cluster --name "$CLUSTER_NAME"
  echo "Kind cluster '$CLUSTER_NAME' created successfully."
fi

# Set the Kind cluster as the active context for kubectl
kubectl config use-context "$CLUSTER_NAME"

# Verify the cluster and nodes
kubectl cluster-info
kubectl get nodes
