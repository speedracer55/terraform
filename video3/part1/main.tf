terraform {
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

resource "azurerm_resource_group" "video3-rg" {
    location = "eastus2"
    name = "video3-rg" 
  
}

resource "azurerm_virtual_network" "video3-vnet" {
  location = azurerm_resource_group.video3-rg.location
  name = "video3_vnet"
  address_space = [ "172.16.0.0/16" ]
   resource_group_name = azurerm_resource_group.video3-rg.name
}

resource "azurerm_subnet" "video3-subnet" {
  name                 = "video3-subnet"
  resource_group_name  = azurerm_resource_group.video3-rg.name
  virtual_network_name = azurerm_virtual_network.video3-vnet.name
  address_prefixes     = ["172.16.1.0/24"]
}

resource "azurerm_network_interface" "vide03-nic" {
    name                = "video3-nic"
  location            = azurerm_resource_group.video3-rg.location
  resource_group_name = azurerm_resource_group.video3-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.video3-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
  
