Terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  default = "rg_test"
  description = "The name of the Resource Group"
}

variable "location" {
    default = "EastUS"
    description = "The name of the azure location"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_public_ip" "pip" {
  name                         = "bookip"
  location                     = "EastUS"
  allocation_method             = "Dynamic"
  resource_group_name          = azurerm_resource_group.rg.name  
  domain_name_label            = "bookdevops"
}
