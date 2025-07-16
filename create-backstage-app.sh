#!/bin/bash

# Create Backstage App Script
echo "🚀 Creating Backstage IDP Application..."

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "❌ npx is not installed. Please install Node.js first."
    exit 1
fi

# Create new Backstage app
echo "📦 Creating new Backstage app..."
npx @backstage/create-app@latest

echo "✅ Backstage app created successfully!"
echo ""
echo "📋 Next steps:"
echo "1. cd into your new app directory"
echo "2. Copy .env.example to .env and add your GitHub credentials"
echo "3. Run 'yarn dev' to start development server"
echo "4. Use the k8s/ folder from this repo to deploy to Kubernetes"