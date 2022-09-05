# Module sysdig monitor instance

This module is used to create sysdig monitor instance.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "sysdig" {
  name = var.resource_group
}

module "monitoring_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm//modules/monitoring-sysdig"

  source            = "../../modules/monitoring-sysdig"
  provision         = var.provision
  bind_key          = var.bind_key
  name              = var.name
  resource_group_id = data.ibm_resource_group.sysdig.id
  plan              = var.plan
  region            = var.region
  service_endpoints = var.service_endpoints
  enable_platform_metrics = var.enable_platform_metrics
  tags              = var.tags
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
  key_name          = var.key_name
  key_tags          = var.key_tags
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.45.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_monitoring_instance"></a> [monitoring\_instance](#module\_monitoring\_instance) | ../../modules/monitoring-sysdig | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_resource_group.sysdig](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.45.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bind_key"></a> [bind\_key](#input\_bind\_key) | Flag indicating that key should be bind to logdna hippa instance | `bool` | `false` | no |
| <a name="input_create_timeout"></a> [create\_timeout](#input\_create\_timeout) | Timeout duration for create. | `string` | `null` | no |
| <a name="input_delete_timeout"></a> [delete\_timeout](#input\_delete\_timeout) | Timeout duration for delete. | `string` | `null` | no |
| <a name="input_enable_platform_metrics"></a> [enable\_platform\_metrics](#input\_enable\_platform\_metrics) | Receive platform metrics in Sysdig | `bool` | `true` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the instance key | `string` | `null` | no |
| <a name="input_key_tags"></a> [key\_tags](#input\_key\_tags) | Tags that should be applied to the key | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the instance | `string` | n/a | yes |
| <a name="input_plan"></a> [plan](#input\_plan) | plan type (graduated-tier, graduated-tier-sysdig-secure-plus-monitor and lite) | `string` | `"graduated-tier"` | no |
| <a name="input_provision"></a> [provision](#input\_provision) | Disable this to read the existing activity tracker instance | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | Provisioning Region | `string` | `"us-south"` | no |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Enter resource group name | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | Types of the service endpoints. Possible values are 'public', 'private', 'public-and-private'. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags that should be applied to the service | `list(string)` | `null` | no |
| <a name="input_update_timeout"></a> [update\_timeout](#input\_update\_timeout) | Timeout duration for update. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
