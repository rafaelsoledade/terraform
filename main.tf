provider "azurerm" {
  features {}
}

# Creating a Resource Group
resource "azurerm_resource_group" "testRG" {
        name = "${var.resource_env}-RG-${var.azure_region_suffix}"
        location = "${var.azure_region}"
}


# Creating a Service Bus
resource "azurerm_servicebus_namespace" "testSB" {
  name                = "${var.resource_env}-SB-${var.azure_region_suffix}"
  location            = azurerm_resource_group.testRG.location
  resource_group_name = azurerm_resource_group.testRG.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}


# Creating Topic (e.g. naming convention DEV-sbt-fpcommission-northeu)
resource "azurerm_servicebus_topic" "testSBT" {
  name                = "${var.resource_env}-sbt-fpcommission-${var.azure_region_suffix}"
  resource_group_name = azurerm_resource_group.testRG.name
  namespace_name      = azurerm_servicebus_namespace.testSB.name
  enable_partitioning = true
}


# Creating a subscription for a given topic (e.g. DEV-subs-fpdebitcard-northeu)
resource "azurerm_servicebus_subscription" "testSubs" {
  name                = "${var.resource_env}-subs-fpdebitcard-${var.azure_region_suffix}"
  resource_group_name = azurerm_resource_group.testRG.name
  namespace_name      = azurerm_servicebus_namespace.testSB.name
  topic_name          = azurerm_servicebus_topic.testSBT.name
  max_delivery_count  = 1
}
