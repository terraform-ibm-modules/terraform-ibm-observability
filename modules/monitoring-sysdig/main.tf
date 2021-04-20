#####################################################
# Sysdig instance key
# Copyright 2020 IBM
#####################################################

locals {
  bind = var.bind_resource_key
}


resource "ibm_resource_instance" "sysdig_instance" {

  name              = var.service_name
  service           = "sysdig-monitor"
  plan              = var.plan
  location          = var.region
  resource_group_id = var.resource_group_id
  tags              = (var.tags != null ? var.tags : [])
  service_endpoints = (var.service_endpoints != "" ? var.service_endpoints : null)
}

resource "ibm_resource_key" "sysdigKey" {
  count                = local.bind ? 1 : 0
  name                 = var.resource_key_name
  role                 = var.role
  resource_instance_id = ibm_resource_instance.sysdig_instance.id
  tags                 = (var.resource_key_tags != null ? var.resource_key_tags : [])
}

