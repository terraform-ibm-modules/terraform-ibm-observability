#####################################################
# logdna HIPPA instance provision
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logdna_instance" {
  source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"

  bind_resource_key = var.bind_resource_key
  service_name      = var.service_name
  resource_group_id = data.ibm_resource_group.logdna.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  tags              = var.tags
  resource_key_name = var.resource_key_name
  role              = var.role
  resource_key_tags = var.resource_key_tags
}