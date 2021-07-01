#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

############ access group ###########################
variable "name" {
  description = "Name of the access group"
  type        = string
}

variable "description" {
  description = "Description to access group"
  type        = string
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "provision" {
  type        = bool
  description = "Would you like to provision a new access group (true/false)"
  default     = true
}

############ access group memeber ####################

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

############ access group policy ####################

variable "policies" {
  description = "list of policies"
  type        = map(any)
}

############ access group dynamic rule ##################

variable "dynamic_rules" {
  description = "list of dynamic rules"
  type        = map(any)
}
