variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
  default     = "${{ values.azureSubscription }}"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "${{ values.resourceGroup }}"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "${{ values.name }}"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}