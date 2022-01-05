#####################################################
# Activity Tracker as a service
# Copyright 2020 IBM
#####################################################

variable "is_provision_activity_tracker" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

############# ATS specific parameters start ####################

variable "ats_service_supertenant" {
  type        = string
  description = "ATS: Name of your supertenant service"
  default     = "" //provide valid values here
}

variable "supertenant_activity_tracker_provision_key" {
  type        = string
  description = "ATS: activity_tracker Provision key"
  default     = "" //provide valid values here
}

variable "is_supertenant_activity_tracker" {
  type        = bool
  description = "Set this to provison ATS instance"
  default     = true
}

variable "is_attach_existing_supertenant_logging_crn" {
  type        = bool
  description = "Enable this to attach existing logging STS instance to activity tracket ATS instance"
  default     = false
}

############# ATS specific parameters end ####################

variable "supertenant_activity_tracker_name" {
  type        = string
  description = "Enter The name of the activity tracker ATS instance"
}

variable "supertenant_activity_tracker_plan" {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "7-day"
}

variable "supertenant_activity_tracker_region" {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default     = "us-south"
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

variable "supertenant_activity_tracker_tags" {
  type        = list(string)
  description = "activity_tracker Tags that should be applied to the service"
  default     = null
}

variable "is_bind_key_to_supertenant_activity_tracker" {
  description = "activity_tracker Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "supertenant_activity_tracker_key_name" {
  description = "activity_tracker Name of the instance key"
  type        = string
  default     = null
}

variable "supertenant_activity_tracker_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

###############################################
# Logging STS instance
###############################################

variable "is_provision_logging" {
  type        = bool
  description = "Disable this to read the existing activity tracker instance"
  default     = true
}

############### STS Specific parameters start ##################

variable "logging_service_supertenant" {
  type        = string
  description = "Logging: Name of your supertenant service"
  default     = "" //provide valid value here
}

variable "supertenant_activity_tracker_associated_logging_crn" {
  type        = string
  description = "Logging: Enter the associated logging crn"
  default     = null //provide valid value here
}

variable "logging_provision_key" {
  type        = string
  description = "Logging: Provision key"
  default     = "" //provide valid value here
}

############### STS Specific parameters end #####################

variable "is_bind_key_to_logging_instance" {
  description = "Flag indicating that key should be bind to logdna hippa instance"
  type        = bool
  default     = false
}

variable "logging_name" {
  description = "Name of the STS instance"
  type        = string
}

variable "logging_plan" {
  description = "plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
  default     = "7-day"
}

variable "logging_region" {
  description = "Provisioning Region"
  type        = string
  default     = "us-south"
}

variable "logging_visibility" {
  description = "Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "logging_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

variable "logging_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the key"
  default     = null
}

variable "logging_key_name" {
  description = "Name of the instance key"
  type        = string
  default     = null
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}




