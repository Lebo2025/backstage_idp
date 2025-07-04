#!/bin/bash

# Build Docker image
echo "Building Backstage Docker image..."
docker build -t backstage:latest .

# Apply Kubernetes manifests
echo "Deploying to Kubernetes..."
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/secrets.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Wait for deployment
echo "Waiting for deployment to be ready..."
kubectl wait --for=condition=available --timeout=300s deployment/backstage -n backstage

# Get service info
echo "Getting service information..."
kubectl get services -n backstage

echo "Deployment complete!"