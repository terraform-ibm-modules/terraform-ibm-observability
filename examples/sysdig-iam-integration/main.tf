#####################################################
# Granting IAM permissions to launch sysdig
# Copyright 2020 IBM
#####################################################

provider "ibm" {
}

module "access_group" {
  // Uncomment following line to point the source to registry level module
  source = "terraform-ibm-modules/iam/ibm//modules/access-group"

  ######### access group ######################
  name        = var.name
  tags        = var.tags
  description = var.description
  provision   = var.provision

  ######### access group members ##############
  ibm_ids     = var.ibm_ids
  service_ids = var.service_ids

  ######### access group policy ###############
  policies = var.policies

  ######### access group dynamic rule #########
  dynamic_rules = var.dynamic_rules
}