#!/bin/bash

# Set variables
AWS_REGION="eu-west-1"
AWS_ACCOUNT_ID="645670942706"
ECR_REPO="backstage"
IMAGE_TAG="latest"

echo "🚀 Deploying Backstage to EKS..."

# 1. Create ECR repository if it doesn't exist
echo "📦 Creating ECR repository..."
aws ecr describe-repositories --repository-names $ECR_REPO --region $AWS_REGION 2>/dev/null || \
aws ecr create-repository --repository-name $ECR_REPO --region $AWS_REGION

# 2. Get ECR login token
echo "🔐 Logging into ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# 3. Build Docker image
echo "🏗️ Building Docker image..."
docker build -t $ECR_REPO:$IMAGE_TAG .

# 4. Tag image for ECR
echo "🏷️ Tagging image..."
docker tag $ECR_REPO:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG

# 5. Push image to ECR
echo "📤 Pushing image to ECR..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG

# 6. Deploy to Kubernetes
echo "☸️ Deploying to Kubernetes..."
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/secrets.yaml
kubectl apply -f k8s/postgres.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# 7. Wait for deployment
echo "⏳ Waiting for deployment..."
kubectl wait --for=condition=available --timeout=300s deployment/backstage -n backstage

# 8. Get service URL
echo "🌐 Getting service URL..."
kubectl get services backstage-service -n backstage

echo "✅ Deployment complete!"
echo "📋 To check status: kubectl get pods -n backstage"
echo "📋 To get logs: kubectl logs -f deployment/backstage -n backstage"