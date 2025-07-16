#!/bin/bash
# Script to update template files from Backstage

TEMPLATE_REPO="https://github.com/your-org/backstage-templates"
TEMPLATE_PATH="azure-pipeline"

echo "Checking for template updates..."

# Download latest template files
curl -s "$TEMPLATE_REPO/raw/main/$TEMPLATE_PATH/azure-pipelines.yml" -o azure-pipelines.yml.new
curl -s "$TEMPLATE_REPO/raw/main/$TEMPLATE_PATH/terraform/main.tf" -o terraform/main.tf.new

# Compare and prompt for update
if ! diff -q azure-pipelines.yml azure-pipelines.yml.new > /dev/null; then
    echo "Pipeline updates available. Review and apply manually."
fi

echo "Update check complete."