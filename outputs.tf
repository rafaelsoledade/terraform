output "Namespace Connection String" {
  value = "${azurerm_servicebus_namespace.var.servicebus_resource_name.default_primary_connection_string}"
}

output "Shared Access Policy PrimaryKey" {
  value = "${azurerm_servicebus_namespace.var.servicebus_resource_name.default_primary_key}"
}
