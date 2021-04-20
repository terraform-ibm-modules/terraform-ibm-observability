#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "access_group" {
  source = "terraform-ibm-modules/iam/ibm//modules/access-group"

  name        = var.name
  tags        = var.ag_tags
  description = var.description
}

module "access_group_policy" {
  source             = "terraform-ibm-modules/iam/ibm//modules/access-group-policy"
  access_group_id    = module.access_group.access_group_id
  roles              = var.roles
  tags               = var.ag_policy_tags
  resources          = var.resources
  account_management = var.account_management
}

module "access_group_members" {
  source          = "terraform-ibm-modules/iam/ibm//modules/access-group-members"
  access_group_id = module.access_group.access_group_id
  ibm_ids         = var.ibm_ids
  service_ids     = var.service_ids
}