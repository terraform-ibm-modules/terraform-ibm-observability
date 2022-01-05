#####################################################
# activity tracker as a service
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Activity tracket ATS instance
###################################################################

module "activity_tracker_instance" {

  source                                   = "./../../modules/activity-tracker-instance"
  is_provision_activity_tracker            = var.is_provision_activity_tracker
  is_supertenant_activity_tracker          = false
  name                                     = var.name
  plan                                     = var.plan
  region                                   = var.region
  is_bind_key                              = var.is_bind_key
  key_name                                 = var.key_name
  key_tags                                 = var.key_tags
  resource_group_id                        = data.ibm_resource_group.res_group.id
  tags                                     = var.tags
  is_activity_tracker_the_default_receiver = var.is_activity_tracker_the_default_receiver
  create_timeout                           = var.create_timeout
  update_timeout                           = var.update_timeout
  delete_timeout                           = var.delete_timeout
}

