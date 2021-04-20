#####################################################
# activity tracker as a service
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

module "activity-tracker_instance" {
  source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  service_name      = var.service_name
  plan              = var.plan
  region            = var.region
  resource_group_id = data.ibm_resource_group.res_group.id
  tags              = var.tags
}
