# Module logging-logdna-hippa-instance

This module is used to create a logging-logdna service for HIPPA instance on IBM Cloud.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logdna_instance" {
  source  = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"


  bind_resource_key   = var.bind_resource_key
  service_name        = var.service_name
  resource_group_id   = data.ibm_resource_group.logdna.id
  plan                = var.plan
  region              = var.region
  service_endpoints   = var.service_endpoints
  tags                = var.tags
  resource_key_name   = var.resource_key_name
  role                = var.role
  resource_key_tags   = var.resource_key_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs


| Name               | Description                                                      | Type         | Default | Required |
|--------------------|------------------------------------------------------------------|:-------------|:------- |:---------|
| service\_name      | A descriptive name used to identify the resource instance        | string       | n/a     | yes      |
| bind_resource_key  | Indicating that instance key should be bind to logdna instance   | bool         | n/a     | no       |
| resource\_key\_name| A descriptive name used to identify the resource key             | string       | n/a     | yes      |
| role               | Name of the user role.                                           | string       | n/a     | yes      |
| plan               | The name of the plan type supported by service.                  | string       | n/a     | yes      |
| region             | Target location or environment to create the resource instance.  | string       | n/a     | yes      |
| resource\_group    | Name of the resource group                                       | string       | n/a     | yes      |
| service\_endpoints | Possible values are 'public', 'private', 'public-and-private'.   | string       | n/a     | no       |
| tags               | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| resource_key_tags  | Tags that should be applied to the resource key                  | list(string) | n/a     | no       |

## NOTE

To attach a key to logdna instance enable it by setting `bind_resource_key` argument to true (which is by default false). And set the `resource_key_name` and `role` parameters accordingly (which are by deafult empty) in variables.tf file.

## Usage

To create an infrastructure run the following command

  `terraform apply`

Similarly to remove an infrastructure run the following command

   `terraform destroy`