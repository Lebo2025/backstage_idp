# Azure DevOps Pipeline Template

A Backstage software template that creates a new project with Azure DevOps CI/CD pipeline and infrastructure deployment.

## 🚀 Features

- ✅ GitHub repository creation
- ✅ Azure infrastructure deployment via Terraform
- ✅ GitHub Actions CI/CD pipeline
- ✅ Automatic Backstage catalog registration
- ✅ Azure App Service deployment ready

## 📋 Prerequisites

### GitHub Organization Secrets
Set up these organization-level secrets in GitHub:

- `AZURE_CLIENT_ID` - Azure service principal client ID
- `AZURE_TENANT_ID` - Azure tenant ID  
- `AZURE_CLIENT_SECRET` - Azure service principal secret
- `AZURE_SUBSCRIPTION_ID` - Azure subscription ID

### Azure Setup
1. Create Azure service principal:
```bash
az ad sp create-for-rbac --name "backstage-github-actions" --role contributor --scopes /subscriptions/{subscription-id}
```

2. Note the output values for GitHub secrets above

## 🎯 Template Usage

1. **Access Backstage** - Go to your Backstage instance
2. **Create Component** - Navigate to "Create" → "Choose a template"
3. **Select Template** - Choose "Azure DevOps Pipeline"
4. **Fill Parameters**:
   - **Name**: Unique component name
   - **Description**: Project description
   - **Owner**: Team/user owner
   - **Repository**: GitHub repository location
   - **Azure Subscription**: Your Azure subscription ID
   - **Resource Group**: Target resource group name
   - **App Service Plan**: Azure App Service Plan name

5. **Execute Template** - Click "Create"

## 📁 Generated Structure

The template creates:

```
your-new-repo/
├── .github/workflows/
│   └── deploy.yml           # GitHub Actions workflow
├── terraform/
│   ├── main.tf             # Terraform configuration
│   ├── variables.tf        # Input variables
│   └── outputs.tf          # Output values
├── src/                    # Application source code
├── catalog-info.yaml       # Backstage catalog metadata
└── README.md              # Project documentation
```

## 🔧 Configuration

### Repository Secrets
After template execution, add these repository-specific secrets:

- `AZURE_RESOURCE_GROUP` - Your resource group name
- `APP_NAME` - Your application name

### Workflow Triggers
The GitHub Actions workflow runs on:
- Push to `main` branch
- Manual trigger via Actions tab

## 🚀 Deployment Process

1. **Infrastructure**: Terraform creates Azure resources
2. **Application**: Deploys to Azure App Service
3. **Catalog**: Registers component in Backstage

## 📚 Template Structure

- `template.yaml` - Backstage template definition
- `content/` - Template files and structure
- `content/.github/workflows/` - CI/CD pipeline
- `content/terraform/` - Infrastructure as code

## 🛠️ Customization

To modify the template:

1. Edit `template.yaml` for parameters
2. Update `content/` directory with your files
3. Modify Terraform in `content/terraform/`
4. Adjust GitHub Actions in `content/.github/workflows/`

## 🔍 Troubleshooting

### Common Issues

**Authentication Failed**
- Verify GitHub organization secrets are set correctly
- Check Azure service principal permissions

**Terraform Errors**
- Ensure resource group exists
- Verify subscription access
- Check naming conflicts

**Deployment Failed**
- Review GitHub Actions logs
- Validate Terraform configuration
- Check Azure resource quotas

## 📖 References

- [Backstage Software Templates](https://backstage.io/docs/features/software-templates/)
- [Azure GitHub Actions](https://docs.microsoft.com/en-us/azure/developer/github/)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)