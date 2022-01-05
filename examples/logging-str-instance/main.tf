#####################################################
# logdna resource Key attach
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logging_instance" {

  source                 = "./../../modules/logging-instance"
  is_provision_logging   = var.is_provision_logging
  is_supertenant_logging = false
  is_bind_key            = var.is_bind_key
  name                   = var.name
  resource_group_id      = data.ibm_resource_group.logdna.id
  plan                   = var.plan
  region                 = var.region
  visibility             = var.visibility
  enable_platform_logs   = var.enable_platform_logs
  tags                   = var.tags
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
  key_name               = var.key_name
  key_tags               = var.key_tags
}