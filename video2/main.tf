# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used


# Configure the Microsoft Azure Provider




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