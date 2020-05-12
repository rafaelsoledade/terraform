provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "testing-resource-group"
  location = "westus"
}

