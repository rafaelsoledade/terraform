provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "exampleRg" {
  name     = "example-rg"
  location = "West Europe"
}
