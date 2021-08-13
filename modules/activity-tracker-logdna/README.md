# Module activity_tracker

This module is used to provision a activity tracker as a service

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "res_group" {
  name = var.resource_group
}

module "activity-tracker_instance" {
  source = "terraform-ibm-modules/observability/ibm//modules/activity-tracker-logdna"

  service_name      = var.service_name
  plan              = var.plan
  region            = var.region
  resource_group_id = data.ibm_resource_group.res_group.id
  parameters        = var.parameters
  tags              = var.tags
  create            = var.create_timeout
  update            = var.update_timeout
  delete            = var.delete_timeout

}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name            | Description                                                      | Type         | Default | Required |
|-----------------|------------------------------------------------------------------|:-------------|---------|----------|
| service\_name   | Name of the service                                              | string       | n/a     | yes      |
| plan            | Type of plan the service instance should run under               | string       | n/a     | yes      |
| region          | Location of the resource                                         | string       | n/a     | yes      |
| tags            | Tags that should be applied to the service                       | list(string) | n/a     | no       |
| resource\_group | Name of the resource group                                       | string       | n/a     | yes      |
| parameters      | Arbitrary parameters to pass                                     | map(string)  | n/a     | no       |
| create_timeout  | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout  | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout  | Timeout duration for delete                                      | string       | n/a     | no       |

## Outputs

<<<<<<< HEAD
| Name            | Description                                                      | Type         |
|-----------------|------------------------------------------------------------------|:-------------|
| tracker_id      | ID of the activity tracker provisioned                           | string       |
| tracker_guid    | GUID of the activity tracker                                     | string       |

=======
| Name            | Description                            |
|-----------------|----------------------------------------|
| id              | ID of the activity tracker instance    |
| guid            | GUID of the activity tracker instance  |
| key_id          | ID of the activity tracker instance key|
| key_guid        | ID of the activity tracker instance key|
| key_credentials | ID of the activity tracker instance key|
>>>>>>> Ob root module (#10)

