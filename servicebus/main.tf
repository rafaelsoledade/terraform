provider "azurerm" {
  features {}
}

# Creating a Resource Group
resource "azurerm_resource_group" "resourceGroup" {
        name = "testServiceGroup"
        location = "westus"
}
