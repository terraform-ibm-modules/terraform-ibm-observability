#####################################################
# Monitoring service instance
# Copyright 2020 IBM
#####################################################

data "ibm_resource_instance" "sysdig" {
  count = var.is_provision_monitoring ? 0 : 1

  name              = var.name
  location          = var.region
  resource_group_id = var.resource_group_id
  service           = "sysdig-monitor"
}

resource "ibm_resource_instance" "sysdig_instance" {

  count = var.is_provision_monitoring ? 1 : 0

  name              = var.name
  service           = "sysdig-monitor"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = (var.tags != null ? var.tags : [])
  service_endpoints = (var.visibility != "" ? var.visibility : null)
  parameters = {
    "default_receiver" = var.is_enable_platform_metrics
  }

  timeouts {
    create = (var.create_timeout != null ? var.create_timeout : null)
    update = (var.update_timeout != null ? var.update_timeout : null)
    delete = (var.delete_timeout != null ? var.delete_timeout : null)
  }
}

resource "ibm_resource_key" "sysdigKey" {
  count                = var.is_bind_key ? 1 : 0
  name                 = var.key_name
  role                 = "Manager"
  resource_instance_id = var.is_provision_monitoring ? ibm_resource_instance.sysdig_instance[0].id : data.ibm_resource_instance.sysdig[0].id
  tags                 = (var.key_tags != null ? var.key_tags : [])
}

