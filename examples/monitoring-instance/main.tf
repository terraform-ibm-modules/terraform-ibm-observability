#####################################################
# Sysdig monitor instance
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "monitoring_instance" {

  source                     = "../../modules/monitoring-sysdig"
  is_provision_monitoring    = var.is_provision_monitoring
  is_bind_key                = var.is_bind_key
  name                       = var.name
  resource_group_id          = data.ibm_resource_group.sysdig.id
  plan                       = var.plan
  region                     = var.region
  visibility                 = var.visibility
  is_enable_platform_metrics = var.is_enable_platform_metrics
  tags                       = var.tags
  create_timeout             = var.create_timeout
  update_timeout             = var.update_timeout
  delete_timeout             = var.delete_timeout
  key_name                   = var.key_name
  key_tags                   = var.key_tags
}
