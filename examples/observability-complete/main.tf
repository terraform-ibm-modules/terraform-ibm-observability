#####################################################
# Observability
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "observability" {

  source = "../../"

  ################# Logging Super Tenant Receiver (STR) instance #######################

  is_provision_logging   = var.is_provision_logging
  is_bind_key_to_logging = var.is_bind_key_to_logging
  enable_platform_logs   = var.enable_platform_logs
  logging_plan           = var.logging_plan
  logging_region         = var.logging_region
  logging_visbility      = var.logging_visbility
  logging_tags           = var.logging_tags
  logging_key_name       = var.logging_key_name
  logging_key_tags       = var.logging_key_tags

  ################## Logging Super Tenant Sender (STS) Instance ########################
  //STS
  is_provision_supertenant_logging  = var.is_provision_supertenant_logging
  sts_service_supertenant           = var.sts_service_supertenant
  supertenant_logging_provision_key = var.supertenant_logging_provision_key

  //Logging
  is_bind_key_to_supertenant_logging = var.is_bind_key_to_supertenant_logging
  supertenant_logging_plan           = var.supertenant_logging_plan
  supertenant_logging_region         = var.supertenant_logging_region
  supertenant_logging_visibility     = var.supertenant_logging_visibility
  supertenant_logging_tags           = var.supertenant_logging_tags
  supertenant_logging_key_name       = var.supertenant_logging_key_name
  supertenant_logging_key_tags       = var.supertenant_logging_key_tags

  ################# Activity Tracker ATR instance ##########

  is_provision_activity_tracker            = var.is_provision_activity_tracker
  activity_tracker_plan                    = var.activity_tracker_plan
  activity_tracker_region                  = var.activity_tracker_region
  is_bind_key_to_activity_tracker          = var.is_bind_key_to_activity_tracker
  is_activity_tracker_the_default_receiver = var.is_activity_tracker_the_default_receiver
  activity_tracker_key_name                = var.activity_tracker_key_name
  activity_tracker_key_tags                = var.activity_tracker_key_tags
  activity_tracker_tags                    = var.activity_tracker_tags

  ################# Activity Tracker ATS instance ##########

  //ATS
  is_provision_supertenant_activity_tracker  = var.is_provision_supertenant_activity_tracker
  supertenant_activity_tracker_name          = var.supertenant_activity_tracker_name
  supertenant_activity_tracker_provision_key = var.supertenant_activity_tracker_provision_key
  is_attach_existing_supertenant_logging_crn = var.is_attach_existing_supertenant_logging_crn

  //Activity tracker
  supertenant_activity_tracker_plan           = var.supertenant_activity_tracker_plan
  supertenant_activity_tracker_region         = var.supertenant_activity_tracker_region
  is_bind_key_to_supertenant_activity_tracker = var.is_bind_key_to_supertenant_activity_tracker
  supertenant_activity_tracker_key_name       = var.supertenant_activity_tracker_key_name
  supertenant_activity_tracker_key_tags       = var.supertenant_activity_tracker_key_tags
  supertenant_activity_tracker_tags           = var.supertenant_activity_tracker_tags

  ################# Monitoring ############################
  is_provision_monitoring    = var.is_provision_monitoring
  is_bind_key_to_monitoring  = var.is_bind_key_to_monitoring
  monitoring_name            = var.monitoring_name
  monitoring_plan            = var.monitoring_plan
  monitoring_region          = var.monitoring_region
  monitoring_visibility      = var.monitoring_visibility
  is_enable_platform_metrics = var.is_enable_platform_metrics
  monitoring_tags            = var.monitoring_tags
  monitoring_key_name        = var.monitoring_key_name
  monitoring_key_tags        = var.monitoring_key_tags


  ################ Generic Parameters ######################
  logging_name          = var.logging_name          // common for STS and STR
  activity_tracker_name = var.activity_tracker_name //common for ATS and ATR
  resource_group_id     = data.ibm_resource_group.rg.id
  create_timeout        = var.create_timeout
  update_timeout        = var.update_timeout
  delete_timeout        = var.delete_timeout
}

