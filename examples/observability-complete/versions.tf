#####################################################
# Sysdig monitor instance
# Copyright 2020 IBM
#####################################################

/***************************************************
NOTE: To source a particular version of IBM terraform provider version, configure the parameter `version`.

terraform {
  required_version = ">=0.13"
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.44.3"
    }
  }
}
If we dont configure the version parameter, it fetched latest provider version.
****************************************************/

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.44.3"
    }
  }
}
