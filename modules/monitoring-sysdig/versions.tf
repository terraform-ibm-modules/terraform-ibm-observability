#####################################################
# Sysdig instance key
# Copyright 2020 IBM
#####################################################

terraform {
  required_providers {
    sysdig = {
      source  = "sysdiglabs/sysdig"
      version = "0.5.10"
    }

    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}
