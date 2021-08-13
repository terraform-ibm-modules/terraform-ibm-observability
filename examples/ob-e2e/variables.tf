######################################################
# Activity Tracker
######################################################

variable "at_service_name" {
  type        = string
  description = "Activity Tracker: The name of the activity tracker"
}

variable "at_plan" {
  type        = string
  description = "Activity Tracker: plan type (lite, 7-day, 14-day, or 30-day)"
}

variable "at_region" {
  type        = string
  description = "Activity Tracker: Geographic location of the resource (e.g. us-south, us-east)"
}

variable "resource_group" {
  type        = string
  description = "Name of the Resource group."
}


variable "at_bind_key" {
  description = "Activity Tracker: Enable this to bind key to instance (true/false)"
  type        = bool
  default     = false
}

variable "at_create_instance" {
  description = "Activity Tracker: Controls if Activity Tracker should be created"
  type        = bool
  default     = true
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

variable "at_parameters" {
  type        = map(string)
  description = "Activity Tracker: Arbitrary parameters to pass"
  default     = null
}

variable "at_tags" {
  type        = list(string)
  description = "Activity Tracker: Tags that should be applied to the service"
  default     = null
}

variable "at_resource_key_name" {
  description = "Name of the instance key"
  type        = string
  default     = ""
}

variable "at_role" {
  description = "role type (Writer, Reader, Manager, Administrator, Operator, Viewer, and Editor)"
  type        = string
  default     = ""
}

variable "at_resource_key_tags" {
  type        = list(string)
  description = "Tags that should be applied to the service"
  default     = null
}

######################################################
# Logdna
######################################################

variable "logdna_service_name" {
  description = "Logdna: Name of the instance"
  type        = string
}

variable "logdna_plan" {
  description = "Logdna: plan type (14-day, 30-day, 7-day, hipaa-30-day and lite)"
  type        = string
}

variable "logdna_region" {
  description = "Logdna: Provisioning Region"
  type        = string
}

variable "logdna_create_instance" {
  description = "logdna : Controls if logdna should be created"
  type        = bool
  default     = true
}
variable "logdna_bind_key" {
  description = "Logdna: Enable this to bind key to logdna instance (true/false)"
  type        = bool
  default     = false
}

variable "logdna_parameters" {
  type        = map(string)
  description = "Logdna: Arbitrary parameters to pass"
  default     = null
}

variable "logdna_service_endpoints" {
  description = "Logdna: Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "logdna_tags" {
  type        = list(string)
  description = "Logdna: Tags that should be applied to the service"
  default     = null
}

variable "logdna_resource_key_name" {
  description = "Logdna: Name of the instance key"
  type        = string
  default     = ""
}

variable "logdna_role" {
  description = "Logdna: role type (Writer, Reader, Manager, Administrator, Operator, Viewer, and Editor)"
  type        = string
  default     = ""
}

variable "logdna_resource_key_tags" {
  type        = list(string)
  description = "Logdna: Tags that should be applied to the service"
  default     = null
}

######################################################
# Sysdig monitoring
######################################################

variable "sysdig_service_name" {
  description = "sysdig: Name of the instance"
  type        = string
}

variable "sysdig_plan" {
  description = "sysdig : plan type (graduated-tier, graduated-tier-sysdig-secure-plus-monitor and lite)"
  type        = string
}

variable "sysdig_region" {
  description = "sysdig: Provisioning Region"
  type        = string
}

variable "sysdig_create_instance" {
  description = "sysdig: Controls if sysdig should be created"
  type        = bool
  default     = true
}

variable "sysdig_bind_key" {
  description = "sysdig: Enable this to bind key to sysdig instance (true/false)"
  type        = bool
  default     = false
}

variable "sysdig_parameters" {
  type        = map(string)
  description = "sysdig: Arbitrary parameters to pass"
  default     = null
}

variable "sysdig_service_endpoints" {
  description = "sysdig: Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'."
  type        = string
  default     = null
}

variable "sysdig_tags" {
  type        = list(string)
  description = "sysdig: Tags that should be applied to the service"
  default     = null
}

variable "sysdig_resource_key_name" {
  description = "sysdig: Name of the instance key"
  type        = string
  default     = ""
}

variable "sysdig_role" {
  description = "sysdig: role type (Writer, Reader, Manager, Administrator, Operator, Viewer, and Editor)"
  type        = string
  default     = ""
}

variable "sysdig_resource_key_tags" {
  type        = list(string)
  description = "sysdig: Tags that should be applied to the service"
  default     = null
}
