
#####################################################
# Observability service
# Copyright 2020 IBM
#####################################################

locals {
  logdna_bind_key = (var.logdna_create_instance && var.logdna_bind_key)
  at_bind_key     = (var.at_create_instance && var.at_bind_key)
  sysdig_bind_key = (var.sysdig_create_instance && var.sysdig_bind_key)
}

######################################################
# Logdna
######################################################

resource "ibm_resource_instance" "logdna_instance" {
  count = var.logdna_create_instance ? 1 : 0

  name              = var.logdna_service_name
  service           = "logdna"
  plan              = var.logdna_plan
  location          = var.logdna_region
  resource_group_id = var.resource_group_id
  tags              = (var.logdna_tags != null ? var.logdna_tags : null)
  service_endpoints = (var.logdna_service_endpoints != null ? var.logdna_service_endpoints : null)
  parameters        = (var.logdna_parameters != null ? var.logdna_parameters : null)

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "logdnaKey" {
  count                = local.logdna_bind_key ? 1 : 0
  name                 = var.logdna_resource_key_name
  role                 = var.logdna_role
  resource_instance_id = ibm_resource_instance.logdna_instance[0].id
  tags                 = (var.logdna_resource_key_tags != null ? var.logdna_resource_key_tags : null)
}

######################################################
# activity tracker
######################################################

resource "ibm_resource_instance" "at_instance" {
  count = var.at_create_instance ? 1 : 0

  name              = var.at_service_name
  service           = "logdnaat"
  plan              = var.at_plan
  location          = var.at_region
  resource_group_id = (var.resource_group_id != null ? var.resource_group_id : null)
  tags              = (var.at_tags != null ? var.at_tags : null)
  parameters        = (var.at_parameters != null ? var.at_parameters : null)

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "activity_tracker_key" {
  count                = local.at_bind_key ? 1 : 0
  name                 = var.at_resource_key_name
  role                 = var.at_role
  resource_instance_id = ibm_resource_instance.at_instance[0].id
  tags                 = (var.at_resource_key_tags != null ? var.at_resource_key_tags : null)
}

######################################################
# sysdig monitoring
######################################################

resource "ibm_resource_instance" "sysdig_instance" {
  count = var.sysdig_create_instance ? 1 : 0

  name              = var.sysdig_service_name
  service           = "sysdig-monitor"
  plan              = var.sysdig_plan
  location          = var.sysdig_region
  resource_group_id = var.resource_group_id
  tags              = (var.sysdig_tags != null ? var.sysdig_tags : [])
  service_endpoints = (var.sysdig_service_endpoints != "" ? var.sysdig_service_endpoints : null)
  parameters        = (var.sysdig_parameters != null ? var.sysdig_parameters : null)

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "sysdigKey" {
  count                = local.sysdig_bind_key ? 1 : 0
  name                 = var.sysdig_resource_key_name
  role                 = var.sysdig_role
  resource_instance_id = ibm_resource_instance.sysdig_instance[0].id
  tags                 = (var.sysdig_resource_key_tags != null ? var.sysdig_resource_key_tags : [])
}