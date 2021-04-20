#####################################################
# Logging-logdna  Instance
# Copyright 2020 IBM
#####################################################

/***************************************************
NOTE: To source a particular version of IBM terraform provider version, configure the parameter `version`.

  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.20.0"
    }
  }
}
If we dont configure the version parameter, it fetched latest provider version.
****************************************************/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}