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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_activity_tracker_ats_instance"></a> [activity\_tracker\_ats\_instance](#module\_activity\_tracker\_ats\_instance) | ./../../modules/activity-tracker-instance | n/a |
| <a name="module_logging_sts_instance"></a> [logging\_sts\_instance](#module\_logging\_sts\_instance) | ./../../modules/logging-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.res_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ats_associated_logging_crn"></a> [ats\_associated\_logging\_crn](#input\_ats\_associated\_logging\_crn) | Logging: Enter the associated logging crn | `string` | `""` | no |
| <a name="input_ats_bind_key"></a> [ats\_bind\_key](#input\_ats\_bind\_key) | activity\_tracker Enable this to bind key to instance (true/false) | `bool` | `false` | no |
| <a name="input_ats_key_name"></a> [ats\_key\_name](#input\_ats\_key\_name) | activity\_tracker Name of the instance key | `string` | `null` | no |
| <a name="input_ats_key_tags"></a> [ats\_key\_tags](#input\_ats\_key\_tags) | Tags that should be applied to the key | `list(string)` | `null` | no |
| <a name="input_ats_name"></a> [ats\_name](#input\_ats\_name) | Enter The name of the activity tracker ATS instance | `string` | n/a | yes |
| <a name="input_ats_plan"></a> [ats\_plan](#input\_ats\_plan) | The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day) | `string` | `"7-day"` | no |
| <a name="input_ats_provision"></a> [ats\_provision](#input\_ats\_provision) | Disable this to read the existing activity tracker instance | `bool` | `true` | no |
| <a name="input_ats_provision_key"></a> [ats\_provision\_key](#input\_ats\_provision\_key) | ATS: activity\_tracker Provision key | `string` | `""` | no |
| <a name="input_ats_region"></a> [ats\_region](#input\_ats\_region) | Geographic location of the resource (e.g. us-south, us-east) | `string` | `"us-south"` | no |
| <a name="input_ats_service_supertenant"></a> [ats\_service\_supertenant](#input\_ats\_service\_supertenant) | ATS: Name of your supertenant service | `string` | `""` | no |
| <a name="input_ats_tags"></a> [ats\_tags](#input\_ats\_tags) | activity\_tracker Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | Timeout duration for create. | `string` | `null` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | Timeout duration for delete. | `string` | `null` | no |
| <a name="input_is_ats_instance"></a> [is\_ats\_instance](#input\_is\_ats\_instance) | Set this to provison ATS instance | `bool` | `true` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Name of the resource group | `string` | n/a | yes |
| <a name="input_sts_bind_key"></a> [sts\_bind\_key](#input\_sts\_bind\_key) | Flag indicating that key should be bind to logdna hippa instance | `bool` | `false` | no |
| <a name="input_sts_key_name"></a> [sts\_key\_name](#input\_sts\_key\_name) | Name of the instance key | `string` | `null` | no |
| <a name="input_sts_key_tags"></a> [sts\_key\_tags](#input\_sts\_key\_tags) | Tags that should be applied to the key | `list(string)` | `null` | no |
| <a name="input_sts_name"></a> [sts\_name](#input\_sts\_name) | Name of the STS instance | `string` | n/a | yes |
| <a name="input_sts_plan"></a> [sts\_plan](#input\_sts\_plan) | plan type (14-day, 30-day, 7-day, hipaa-30-day and lite) | `string` | `"7-day"` | no |
| <a name="input_sts_provision"></a> [sts\_provision](#input\_sts\_provision) | Disable this to read the existing activity tracker instance | `bool` | `true` | no |
| <a name="input_sts_provision_key"></a> [sts\_provision\_key](#input\_sts\_provision\_key) | Logging: Provision key | `string` | `""` | no |
| <a name="input_sts_region"></a> [sts\_region](#input\_sts\_region) | Provisioning Region | `string` | `"us-south"` | no |
| <a name="input_sts_service_endpoints"></a> [sts\_service\_endpoints](#input\_sts\_service\_endpoints) | Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'. | `string` | `null` | no |
| <a name="input_sts_service_supertenant"></a> [sts\_service\_supertenant](#input\_sts\_service\_supertenant) | Logging: Name of your supertenant service | `string` | `""` | no |
| <a name="input_sts_tags"></a> [sts\_tags](#input\_sts\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | Timeout duration for update. | `string` | `null` | no |
| <a name="input_use_existing_sts_crn"></a> [use\_existing\_sts\_crn](#input\_use\_existing\_sts\_crn) | Enable this to attach existing logging STS instance to activity tracket ATS instance | `bool` | `false` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->