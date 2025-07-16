# ${{ values.name }}

${{ values.description }}

## Infrastructure

This project includes Terraform configuration to deploy:
- Azure Resource Group
- Azure App Service Plan (Linux, B1 SKU)
- Azure App Service (Node.js 18 LTS)

## Deployment

### Prerequisites
- Azure CLI installed and logged in
- Terraform installed

### Deploy Infrastructure
```bash
cd terraform
terraform init
terraform plan
terraform apply
```

### Deploy Application
The Azure DevOps pipeline will automatically deploy the application when code is pushed to the main branch.

## Pipeline
- **Build Stage**: Installs dependencies and builds the application
- **Deploy Stage**: Deploys to Azure App Service using the configured service connection