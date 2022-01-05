###################################################################
# Logging STR (Super Tenant Receiver) instance
###################################################################

module "logging_str_instance" {
  //Uncomment the following line to point the source to registry level
  //source  = "terraform-ibm-modules/observability/ibm//modules/logging-instance"

  count  = var.is_provision_logging ? 1 : 0
  source = "./modules/logging-instance"

  is_supertenant_logging = false
  is_provision_logging   = var.is_provision_logging
  name                   = format("%s-logging-str", var.logging_name)
  is_bind_key            = var.is_bind_key_to_logging
  enable_platform_logs   = var.enable_platform_logs
  resource_group_id      = var.resource_group_id
  plan                   = var.logging_plan
  region                 = var.logging_region
  visibility             = var.logging_visbility
  tags                   = var.logging_tags
  key_name               = var.logging_key_name
  key_tags               = var.logging_key_tags
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
}

###################################################################
# Logging STS (Super Tenant Sender) instance
###################################################################

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source  = "terraform-ibm-modules/observability/ibm//modules/logging-instance"

  count                = (var.is_provision_supertenant_logging || (var.is_provision_supertenant_activity_tracker && var.is_attach_existing_supertenant_logging_crn == false)) ? 1 : 0
  source               = "./modules/logging-instance"
  is_provision_logging = var.is_provision_supertenant_logging

  //STS Specific parameters
  is_supertenant_logging = true
  service_supertenant    = var.sts_service_supertenant
  provision_key          = var.supertenant_logging_provision_key

  //Logging instance parameters
  name              = format("%s-logging-sts", var.logging_name)
  is_bind_key       = var.is_bind_key_to_supertenant_logging
  resource_group_id = var.resource_group_id
  plan              = var.supertenant_logging_plan
  region            = var.supertenant_logging_region
  visibility        = var.supertenant_logging_visibility
  tags              = var.supertenant_logging_tags
  key_name          = var.supertenant_logging_key_name
  key_tags          = var.supertenant_logging_key_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

###################################################################
# Activity tracker ATR (Super Tenant Receiver) instance
###################################################################

module "activity-tracker-atr-instance" {
  //Uncomment the following line to point the source to registry level
  //source  = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-instance"

  count = var.is_provision_activity_tracker ? 1 : 0

  source                                   = "./modules/activity-tracker-instance"
  is_provision_activity_tracker            = var.is_provision_activity_tracker
  is_supertenant_activity_tracker          = false
  name                                     = format("%s-monitoring-atr", var.activity_tracker_name)
  plan                                     = var.activity_tracker_plan
  region                                   = var.activity_tracker_region
  is_bind_key                              = var.is_bind_key_to_activity_tracker
  is_activity_tracker_the_default_receiver = var.is_activity_tracker_the_default_receiver
  key_name                                 = var.activity_tracker_key_name
  key_tags                                 = var.activity_tracker_key_tags
  resource_group_id                        = var.resource_group_id
  tags                                     = var.activity_tracker_tags
  create_timeout                           = var.create_timeout
  update_timeout                           = var.update_timeout
  delete_timeout                           = var.delete_timeout
}

###################################################################
# Activity tracker ATS (Super Tenant Sender) instance
###################################################################

module "activity-tracker-ats-instance" {
  //Uncomment the following line to point the source to registry level
  //source  = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-instance"

  count = var.is_provision_supertenant_activity_tracker ? 1 : 0

  source                        = "./modules/activity-tracker-instance"
  is_provision_activity_tracker = var.is_provision_supertenant_activity_tracker

  //ATS specific parameters
  is_supertenant_activity_tracker = true
  service_supertenant             = var.supertenant_activity_tracker_name
  associated_logging_crn          = var.is_attach_existing_supertenant_logging_crn ? var.supertenant_activity_tracker_associated_logging_crn : module.logging_sts_instance[0].id
  provision_key                   = var.supertenant_activity_tracker_provision_key
  //use_existing_sts_crn   = var.is_attach_existing_supertenant_logging_crn
  //Actvity tracker
  name              = format("%s-monitoring-ats", var.activity_tracker_name)
  plan              = var.supertenant_activity_tracker_plan
  region            = var.supertenant_activity_tracker_region
  is_bind_key       = var.is_bind_key_to_supertenant_activity_tracker
  key_name          = var.supertenant_activity_tracker_key_name
  key_tags          = var.supertenant_activity_tracker_key_tags
  resource_group_id = var.resource_group_id
  tags              = var.supertenant_activity_tracker_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

#####################################################
# Monitoring instance
#####################################################

module "monitoring_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  count = var.is_provision_monitoring ? 1 : 0

  source                     = "./modules/monitoring-sysdig"
  is_provision_monitoring    = var.is_provision_monitoring
  is_bind_key                = var.is_bind_key_to_monitoring
  name                       = format("%s-monitoring", var.monitoring_name)
  resource_group_id          = var.resource_group_id
  plan                       = var.monitoring_plan
  region                     = var.monitoring_region
  visibility                 = var.monitoring_visibility
  is_enable_platform_metrics = var.is_enable_platform_metrics
  tags                       = var.monitoring_tags
  key_name                   = var.monitoring_key_name
  key_tags                   = var.monitoring_key_tags
  create_timeout             = var.create_timeout
  update_timeout             = var.update_timeout
  delete_timeout             = var.delete_timeout
}

