variable "azure_sb_region" {
  type    = string
  default = "westus"
}

variable "sb_name" {
  type    = string
  default = "exampleServiceBus"
}

variable "sbt_name" {
  type    = string
  default = "exampleTopic"
}

variable "subs_name" {
  type    = string
  default = "exampleSubscription"
}

variable "resourcegroup_number" {
  type    = string
  default = "02"
}

variable "resource_env" {
  type    = string
  default = "SIT"
}
