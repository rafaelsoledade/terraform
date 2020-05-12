variable "azure_region" {
  description = "The Azure Region in which all resources in this example should be created."
  type    = string
  default = "westus"
}

variable "resource_env" {
  description = "The environment prefix which should be used for all resources"
  type    = string
  default = "DEV"
}

variable "resource_group_name" {
  description = "The Resource Group under which the service bus is created"
  type    = string
  default = "VER_AZURE_DO_BANCO"
}

variable "servicebus_resource_name" {
  description = "The service bus under which the topics and subscriptions will be created"
  type    = string
  default = "VER_AZURE_DO_BANCO"
}
