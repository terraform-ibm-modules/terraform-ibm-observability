##########################################################
# Sysdig provider downtime alert example
# Copyright 2020 IBM
##########################################################

/*********************************************************
Fetch access token
*********************************************************/
provider "ibm" {}

data "ibm_iam_auth_token" "tokendata" {

}

/*********************************************************
Fetch IBMInstanceID
*********************************************************/

data "ibm_resource_group" "group" {
  name = var.resource_group_name
}

data "ibm_resource_instance" "test_resource_instance" {
  name              = var.instance_name
  location          = var.location
  resource_group_id = data.ibm_resource_group.group.id
}


/*********************************************************
Fetch monitor url
*********************************************************/

data "ibm_resource_key" "resource_key" {
  name = var.service_key_name
}


/*********************************************************
Fetch sysdig iam token
*********************************************************/

data external monitor_api_key {
  program = [
    "bash",                                                # Run with bash
    "${path.module}/scripts/monitor-api-key.sh",           # Script to run
    data.ibm_iam_auth_token.tokendata.iam_access_token,    # IBM Cloud access token
    data.ibm_resource_instance.test_resource_instance.guid # sysdig instance ID
  ]
}

/**************************************************************
Sysdig provider
**************************************************************/

provider "sysdig" {
  sysdig_monitor_api_token = data.external.monitor_api_key.result["api_key"]
  sysdig_monitor_url       = data.ibm_resource_key.resource_key.credentials["Sysdig Endpoint"]
}

resource "sysdig_monitor_alert_downtime" "sample" {
  name        = var.alert_name
  description = var.description
  severity    = var.severity

  entities_to_monitor = var.monitor_list

  trigger_after_minutes = var.trigger_time
  trigger_after_pct     = var.pct
}
