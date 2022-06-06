# Module activity tracker instance

This module is used to provision both activity tracker and activity tracket ATS instances.

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
# Activity tracker ATS instance
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

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_resource_instance.activity_tracker](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [ibm_resource_key.activity_tracker_key](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_key) | resource |
| [ibm_resource_instance.activity_tracker](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_instance) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associated_logging_crn"></a> [associated\_logging\_crn](#input\_associated\_logging\_crn) | CRN associated logging logdna | `string` | `null` | no |
| <a name="input_bind_key"></a> [bind\_key](#input\_bind\_key) | Enable this to bind key to instance (true/false) | `bool` | `false` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | Timeout duration for create. | `string` | `null` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | Timeout duration for delete. | `string` | `null` | no |
| <a name="input_is_ats_instance"></a> [is\_ats\_instance](#input\_is\_ats\_instance) | Set this to provison ATS instance | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the instance key | `string` | `""` | no |
| <a name="input_key_tags"></a> [key\_tags](#input\_key\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_make_default_receiver"></a> [make\_default\_receiver](#input\_make\_default\_receiver) | Enable this to make this instance as default receiver | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Enter The name of the activity tracker ATS instance | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day) | `string` | n/a | yes |
| <a name="input_provision"></a> [provision](#input\_provision) | Disable this to read the existing activity trcaker instance | `bool` | `true` | no |
| <a name="input_provision_key"></a> [provision\_key](#input\_provision\_key) | Provision key | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | Geographic location of the resource (e.g. us-south, us-east) | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | ID of the Resource group where the cluster has been provisioned. | `string` | n/a | yes |
| <a name="input_service_supertenant"></a> [service\_supertenant](#input\_service\_supertenant) | Name of your supertenant service | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | Timeout duration for update. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_guid"></a> [guid](#output\_guid) | The GUID of the activity tracker |
| <a name="output_id"></a> [id](#output\_id) | ID of Activity Tracker ATS |
| <a name="output_key_credentials"></a> [key\_credentials](#output\_key\_credentials) | Activity Tracker ATS key credentials |
| <a name="output_key_guid"></a> [key\_guid](#output\_key\_guid) | Activity Tracker ATS key guid |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | Activity Tracker ATS key id |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
