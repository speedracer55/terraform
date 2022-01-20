terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "585a1fee-567a-49a6-87b7-1b8663871d29"
  tenant_id       = "289321e0-9db6-4644-b371-956e6056d9eb"
}