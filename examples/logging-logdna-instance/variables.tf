#####################################################
# Logging-logdna  Instance
# Copyright 2020 IBM
#####################################################

variable "bind_resource_key" {
  description = "Flag(0/1) indicating that logdna instance key should be bind to logdna instance"
  type        = bool
}

variable "service_name" {
  description = "Name of the instance"
  type        = string
}

variable "plan" {
  description = "plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
}

variable "region" {
  description = "Provisioning Region"
  type        = string
}

variable "create_timeout" {
  type        = string
  description = "Timeout duration for create."
  default     = null
}

variable "update_timeout" {
  type        = string
  description = "Timeout duration for update."
  default     = null
}

variable "delete_timeout" {
  type        = string
  description = "Timeout duration for delete."
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "Arbitrary parameters to pass"
  default     = null
}


variable "service_endpoints" {
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "resource_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

variable "resource_key_name" {
  description = "Name of the instance key"
  type        = string
}

variable "role" {
  description = "plan type"
  type        = string
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}



