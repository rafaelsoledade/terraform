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
