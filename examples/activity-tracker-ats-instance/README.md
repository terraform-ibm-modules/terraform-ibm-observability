# Module activity tracker ATS instance

This template by default provision an activity tracker instance alone (by default `is_ats_instance` = false). If you want to set up Activity Tracker Super Tenant Sender (ATS) instance by creating a new logging STS instance, configure following parameters

## Provision an activity tracker instance
```
`activity_tracker_provision` = true
`is_ats_instance` = false
`activity_tracker_service_supertenant` = null
`activity_tracker_provision_key` = null
`service_supertenant` = null
`provision_key` = null
```

## Provision ATS activity tracker instance by creating logging STS instance
```
`activity_tracker_provision` = true
`is_ats_instance` = true
`is_sts_instance` = true
`use_existing_sts_crn` = false
`activity_tracker_service_supertenant` = <Name of service_supertenant>
`activity_tracker_provision_key` = <provision_key>
`service_supertenant` = <Name of logging sts service supertenant>
`provision_key` = <Logging provision key>
```

## Provision ATS instance with existing logging STS instance CRN then configure
```
`activity_tracker_provision` = true
`is_ats_instance` = true
`activity_tracker_service_supertenant` = <Name of service_supertenant>
`activity_tracker_provision_key` = <provision_key>
`use_existing_sts_crn` = true
`associated_logging_crn` = <provide logging STS instance CRN>
`service_supertenant` = null
`provision_key` = null
```

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Logging STS instance - required for activity tracker ATS instance
###################################################################

module "logging_sts_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"
  count             = (var.is_ats_instance && var.use_existing_sts_crn == false) ? 1 : 0
  source            = "./../../modules/logging-instance"
  provision         = var.sts_provision
  is_sts_instance   = true                //logging sts is required only if ATS instance is provisioned
  bind_key          = var.sts_bind_key
  name              = var.sts_name
  resource_group_id = data.ibm_resource_group.res_group.id
  plan              = var.sts_plan
  region            = var.sts_region
  service_endpoints = var.sts_service_endpoints
  service_supertenant    = var.sts_service_supertenant
  provision_key          = var.sts_provision_key
  tags              = var.sts_tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name = var.sts_key_name
  key_tags = var.sts_key_tags
}

###################################################################
# Activity tracket ATS instance
###################################################################

module "activity_tracker_ats_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  source                 = "./../../modules/activity-tracker-instance"
  provision              = var.ats_provision
  is_ats_instance        = var.is_ats_instance
  name                   = var.ats_name
  plan                   = var.ats_plan
  region                 = var.ats_region
  bind_key               = var.ats_bind_key
  key_name               = var.ats_key_name
  key_tags               = var.ats_key_tags
  resource_group_id      = data.ibm_resource_group.res_group.id
  service_supertenant    = var.ats_service_supertenant
  associated_logging_crn = var.is_ats_instance ? (var.use_existing_sts_crn ? var.ats_associated_logging_crn : module.logging_sts_instance[0].id) : ""
  provision_key          = var.ats_provision_key
  tags                   = var.ats_tags
  create_timeout         = var.create_timeout
  update_timeout         = var.update_timeout
  delete_timeout         = var.delete_timeout
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
