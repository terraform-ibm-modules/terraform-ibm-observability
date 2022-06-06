# Module activity_tracker

This module is used to provision a activity tracker as a service

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

###################################################################
# Activity tracker ATS instance
###################################################################

module "activity_tracker_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  source                 = "./../../modules/activity-tracker-instance"
  provision              = var.provision
  is_ats_instance        = false
  name                   = var.name
  plan                   = var.plan
  region                 = var.region
  bind_key               = var.bind_key
  key_name               = var.key_name
  key_tags               = var.key_tags
  resource_group_id      = data.ibm_resource_group.res_group.id
  tags                   = var.tags
  //ATS specific
  service_supertenant    = ""
  associated_logging_crn = ""
  provision_key          = ""
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
| <a name="module_activity_tracker_instance"></a> [activity\_tracker\_instance](#module\_activity\_tracker\_instance) | ./../../modules/activity-tracker-instance | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.res_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bind_key"></a> [bind\_key](#input\_bind\_key) | Enable this to bind key to instance (true/false) | `bool` | `false` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | Timeout duration for create. | `string` | `null` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | Timeout duration for delete. | `string` | `null` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the instance key | `string` | `null` | no |
| <a name="input_key_tags"></a> [key\_tags](#input\_key\_tags) | Tags that should be applied to the key | `list(string)` | `null` | no |
| <a name="input_make_default_receiver"></a> [make\_default\_receiver](#input\_make\_default\_receiver) | Enable this to make this instance as default receiver | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Enter The name for the service | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day) | `string` | `"7-day"` | no |
| <a name="input_provision"></a> [provision](#input\_provision) | Disable this to read the existing activity tracker instance | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Geographic location of the resource (e.g. us-south, us-east) | `string` | `"us-south"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Enter the name of the Resource group . | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | Timeout duration for update. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
