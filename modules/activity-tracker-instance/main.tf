#####################################################
# Set up Activity Tracker Super Tenant Sender (ATS) instance
# Copyright 2020 IBM
#####################################################

locals {

  #ATS parameter block
  ats_parameters = {
    "service_supertenant"    = var.service_supertenant
    "associated_logging_crn" = var.associated_logging_crn
    "provision_key"          = var.provision_key
  }

  #ATR parameter block
  atr_parameters = {
    "default_receiver" = var.make_default_receiver
  }

}

data "ibm_resource_instance" "activity_tracker" {
  count = var.provision ? 0 : 1

  name              = var.name
  location          = var.region
  resource_group_id = var.resource_group_id
  service           = "logdnaat"
}

resource "ibm_resource_instance" "activity_tracker" {
  count = var.provision ? 1 : 0

  name              = var.name
  service           = "logdnaat"
  plan              = var.plan
  location          = var.region
  resource_group_id = (var.resource_group_id != null ? var.resource_group_id : null)
  tags              = (var.tags != null ? var.tags : null)
  parameters        = var.is_ats_instance ? local.ats_parameters : local.atr_parameters


  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }

  # Ignore changes to provision key, it changes every quarter.
  lifecycle {
    ignore_changes = [parameters["provision_key"]]
  }
}

resource "ibm_resource_key" "activity_tracker_key" {
  count                = var.bind_key ? 1 : 0
  name                 = var.key_name
  role                 = "Manager"
  resource_instance_id = var.provision ? ibm_resource_instance.activity_tracker[0].id : data.ibm_resource_instance.activity_tracker[0].id
  tags                 = (var.key_tags != null ? var.key_tags : null)
}
