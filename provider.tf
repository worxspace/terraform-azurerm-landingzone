terraform {
  required_providers {
    azurerm = {
      version = ">=3.40.0"
    }
    azurecaf = {
      version = "=>2.0.0-preview3"
      source  = "aztfmod/azurecaf"
    }
    azapi = {
      version = ">=1.3.0"
      source  = "azure/azapi"
    }
  }
}
