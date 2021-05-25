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


