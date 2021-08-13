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
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  source            = "../../modules/activity-tracker-logdna"
  provision         = var.provision
  service_name      = var.service_name
  plan              = var.plan
  region            = var.region
  bind_key          = var.bind_key
  resource_key_name = var.resource_key_name
  role              = var.role
  resource_key_tags = var.resource_key_tags
  resource_group_id = data.ibm_resource_group.res_group.id
  parameters        = var.parameters
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout

}
