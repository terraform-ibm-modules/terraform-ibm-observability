#####################################################
# Observability
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "observability" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm"

  source = "./../.."

  ################# Activity tracker ###############
  at_service_name      = var.at_service_name
  at_bind_key          = var.at_bind_key
  at_create_instance   = var.at_create_instance
  at_plan              = var.at_plan
  at_region            = var.at_region
  at_parameters        = var.at_parameters
  at_tags              = var.at_tags
  at_resource_key_name = var.at_resource_key_name
  at_role              = var.at_role
  at_resource_key_tags = var.at_resource_key_tags

  ################# logdna ###############
  logdna_create_instance   = var.logdna_create_instance
  logdna_bind_key          = var.logdna_bind_key
  logdna_service_name      = var.logdna_service_name
  logdna_plan              = var.logdna_plan
  logdna_region            = var.logdna_region
  logdna_parameters        = var.logdna_parameters
  logdna_tags              = var.logdna_tags
  logdna_service_endpoints = var.logdna_service_endpoints
  logdna_resource_key_name = var.logdna_resource_key_name
  logdna_role              = var.logdna_role
  logdna_resource_key_tags = var.logdna_resource_key_tags

  ################# sysdig monitoring ###############
  sysdig_create_instance   = var.sysdig_create_instance
  sysdig_bind_key          = var.sysdig_bind_key
  sysdig_service_name      = var.sysdig_service_name
  sysdig_plan              = var.sysdig_plan
  sysdig_region            = var.sysdig_region
  sysdig_parameters        = var.sysdig_parameters
  sysdig_tags              = var.sysdig_tags
  sysdig_service_endpoints = var.sysdig_service_endpoints
  sysdig_resource_key_name = var.sysdig_resource_key_name
  sysdig_role              = var.sysdig_role
  sysdig_resource_key_tags = var.sysdig_resource_key_tags

  resource_group_id = data.ibm_resource_group.rg.id
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

