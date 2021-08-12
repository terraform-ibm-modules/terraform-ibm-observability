#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

variable "service_name" {
  type        = string
  description = "Enter The name for the service"
}

variable "plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
}

variable "provision" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

variable "region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
}

variable "resource_group" {
  type        = string
  description = "Enter the name of the Resource group ."
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


variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "bind_key" {
  description = "Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "resource_key_name" {
  description = "Name of the instance key"
  type        = string
  default     = ""
}

variable "role" {
  description = "role type (Writer, Reader, Manager, Administrator, Operator, Viewer, and Editor)"
  type        = string
  default     = ""
}

variable "resource_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}
