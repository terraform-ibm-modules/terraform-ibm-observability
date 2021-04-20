#####################################################
# Sysdig monitor instance
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "sysdig_instance" {
  source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  bind_resource_key = var.bind_resource_key
  service_name      = var.service_name
  resource_group_id = data.ibm_resource_group.sysdig.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  tags              = var.tags
  resource_key_name = var.resource_key_name
  role              = var.role
  resource_key_tags = var.resource_key_tags
}
