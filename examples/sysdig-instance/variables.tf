#####################################################
# Sysdig monitor Instance
# Copyright 2020 IBM
#####################################################

variable "provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

variable "bind_key" {
  description = "Flag indicating that key should be bind to logdna hippa instance"
  type        = bool
  default     = false
}

variable "service_name" {
  description = "Name of the instance"
  type        = string
}

variable "plan" {
  description = "plan type (graduated-tier, graduated-tier-sysdig-secure-plus-monitor and lite)"
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

variable "resource_group" {
  description = "Enter resource group name"
  type        = string
}

variable "region" {
  description = "Provisioning Region"
  type        = string
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

variable "resource_key_name" {
  description = "Name of the instance key"
  type        = string
  default     = ""
}

variable "role" {
  description = "Role type"
  type        = string
  default     = ""
}


variable "resource_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

