#####################################################
# Set up Activity Tracker Super Tenant Sender (ATS) instance
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Logging STS instance - required for activity tracket ATS instance
###################################################################

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"
  count                  = (var.is_supertenant_activity_tracker && var.is_attach_existing_supertenant_logging_crn == false) ? 1 : 0
  source                 = "./../../modules/logging-instance"
  is_provision_logging   = var.is_provision_logging
  is_supertenant_logging = true //logging sts is required only if ATS instance is provisioned
  is_bind_key            = var.is_bind_key_to_logging_instance
  name                   = var.logging_name
  resource_group_id      = data.ibm_resource_group.res_group.id
  plan                   = var.logging_plan
  region                 = var.logging_region
  visibility             = var.logging_visibility
  service_supertenant    = var.logging_service_supertenant
  provision_key          = var.logging_provision_key
  tags                   = var.logging_tags
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
  key_name               = var.logging_key_name
  key_tags               = var.logging_key_tags
}

###################################################################
# Activity tracket ATS instance
###################################################################

module "activity_tracker_ats_instance" {

  source                          = "./../../modules/activity-tracker-instance"
  is_provision_activity_tracker   = var.is_provision_activity_tracker
  is_supertenant_activity_tracker = true
  name                            = var.supertenant_activity_tracker_name
  plan                            = var.supertenant_activity_tracker_plan
  region                          = var.supertenant_activity_tracker_region
  is_bind_key                     = var.is_bind_key_to_supertenant_activity_tracker
  key_name                        = var.supertenant_activity_tracker_key_name
  key_tags                        = var.supertenant_activity_tracker_key_tags
  resource_group_id               = data.ibm_resource_group.res_group.id
  service_supertenant             = var.ats_service_supertenant
  associated_logging_crn          = var.is_supertenant_activity_tracker ? (var.is_attach_existing_supertenant_logging_crn ? var.supertenant_activity_tracker_associated_logging_crn : module.logging_sts_instance[0].id) : ""
  provision_key                   = var.supertenant_activity_tracker_provision_key
  tags                            = var.supertenant_activity_tracker_tags
  create_timeout                  = var.create_timeout
  update_timeout                  = var.update_timeout
  delete_timeout                  = var.delete_timeout
}
