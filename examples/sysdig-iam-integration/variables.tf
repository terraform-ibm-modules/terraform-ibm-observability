#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

variable "name" {
  description = "Name of the access group"
  type        = string
}

variable "description" {
  description = "Description to access group"
  type        = string
  default     = null
}

variable "ag_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "roles" {
  description = "list of roles"
  type        = list(string)
}

variable "ag_policy_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "account_management" {
  description = "Enter true if you want give access to all account management services"
  type        = bool
  default     = false
}

variable "resources" {
  type        = list(any)
  description = "A nested block describes the resource of this policy."
  default     = null
}

variable "ibm_ids" {
  description = "A list of IBM IDs that you want to add to or remove from the access group."
  type        = list(string)
  default     = null
}

variable "service_ids" {
  type        = list(string)
  description = "A list of service IDS that you want to add to or remove from the access group."
  default     = null
}
