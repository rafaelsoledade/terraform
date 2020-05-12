provider "azurerm" {
  version = "=2.0.0"
  features {}
}

resource "azurerm_servicebus_namespace" "${var.servicebus_resource_name}" {
  name                = "${var.servicebus_resource_name}"
  location            = azurerm_resource_group.${var.resource_group_name}.location
  resource_group_name = azurerm_resource_group.${var.resource_group_name}.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_topic" "${var.sbt_resource_name}" {
  name                = "${var.resource_env}-sbt-fpcommission-${var.azure_region}"
  resource_group_name = azurerm_resource_group.${var.resource_group_name}.name
  namespace_name      = azurerm_servicebus_namespace.${var.servicebus_resource_name}.name
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "testSubscription" {
  name                = "${var.resource_env}-subs-fpdebitcard-${var.azure_region}"
  resource_group_name = azurerm_resource_group.${var.resource_group_name}.name
  namespace_name      = azurerm_servicebus_namespace.${var.servicebus_resource_name}.name
  topic_name          = azurerm_servicebus_topic.${var.sbt_resource_name}.name
  max_delivery_count  = 1
}
