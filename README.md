# Backstage Internal Developer Portal

A production-ready Backstage IDP deployment with GitHub authentication and Kubernetes support.

## 🚀 Features

- ✅ GitHub OAuth Authentication
- ✅ Software Catalog
- ✅ Software Templates
- ✅ TechDocs
- ✅ API Explorer
- ✅ Kubernetes Deployment
- ✅ PostgreSQL Database
- ✅ AWS EKS Ready

## 🏃‍♂️ Quick Start

### Create New Backstage App

```bash
# Create new Backstage app with proper structure
./create-backstage-app.sh

# Setup GitHub authentication
./setup-github-auth.sh my-backstage-app

# Copy environment template
cp .env.example my-backstage-app/.env
# Edit .env with your GitHub credentials

# Start development
cd my-backstage-app
yarn dev
```

### Kubernetes Deployment

```bash
./deploy-to-eks.sh
```

## 📁 Project Structure

```
├── k8s/                      # Kubernetes manifests
├── create-backstage-app.sh   # Script to create new Backstage app
├── setup-github-auth.sh      # Script to setup GitHub authentication
├── deploy-to-eks.sh          # EKS deployment script
├── .env.example              # Environment variables template
└── README.md                 # This documentation
```

## 🔧 Configuration

### GitHub Authentication

1. Create GitHub OAuth App
2. Copy `.env.example` to `.env` and update with your credentials
3. Add user to `packages/catalog-model/examples/acme/org.yaml`

### Environment Variables

- `GITHUB_TOKEN` - GitHub personal access token
- `AUTH_GITHUB_CLIENT_ID` - GitHub OAuth client ID
- `AUTH_GITHUB_CLIENT_SECRET` - GitHub OAuth client secret

## 🚀 Deployment

### Prerequisites

- Node.js 18+
- Yarn
- Docker (for K8s deployment)
- kubectl (for K8s deployment)

### Local Development

```bash
# Install dependencies
yarn install

# Setup environment variables
cp .env.example .env
# Edit .env with your GitHub credentials

# Start development server
yarn start
```

### Kubernetes Deployment

See [k8s/README.md](k8s/README.md) for detailed instructions.

## 📚 Documentation

- [Kubernetes Deployment Guide](k8s/README.md)
- [Backstage Documentation](https://backstage.io/docs/)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

Apache 2.0 - See [LICENSE](LICENSE) file for details.
