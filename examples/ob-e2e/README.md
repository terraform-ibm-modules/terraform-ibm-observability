# Module - Configure cluster with observability service

This module is used to create observability services and configure then to an existing cluster.

## Example Usage
```
provider "ibm" {
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

module "sysdig_instance" {
  //Uncomment the following line to point the source to registry level
  //source = "terraform-ibm-modules/observability/ibm"

  source            = "./../.."
  ################# Activity tracker ###############
  at_service_name = var.at_service_name
  at_bind_key     = var.at_bind_key
  at_create_instance = var.at_create_instance
  at_plan = var.at_plan
  at_region = var.at_region
  at_parameters = var.at_parameters
  at_tags = var.at_tags
  at_resource_key_name = var.at_resource_key_name
  at_role = var.at_role
  at_resource_key_tags = var.at_resource_key_tags

  ################# logdna ###############
  logdna_create_instance = var.logdna_create_instance
  logdna_bind_key     = var.logdna_bind_key
  logdna_service_name = var.logdna_service_name
  logdna_plan = var.logdna_plan
  logdna_region = var.logdna_region
  logdna_parameters = var.logdna_parameters
  logdna_tags = var.logdna_tags
  logdna_service_endpoints = var.logdna_service_endpoints
  logdna_resource_key_name = var.logdna_resource_key_name
  logdna_role = var.logdna_role
  logdna_resource_key_tags = var.logdna_resource_key_tags

  ################# sysdig monitoring ###############
  sysdig_create_instance = var.sysdig_create_instance
  sysdig_bind_key     = var.sysdig_bind_key
  sysdig_service_name = var.sysdig_service_name
  sysdig_plan = var.sysdig_plan
  sysdig_region = var.sysdig_region
  sysdig_parameters = var.sysdig_parameters
  sysdig_tags = var.sysdig_tags
  sysdig_service_endpoints = var.sysdig_service_endpoints
  sysdig_resource_key_name = var.sysdig_resource_key_name
  sysdig_role = var.sysdig_role
  sysdig_resource_key_tags = var.sysdig_resource_key_tags

  resource_group_id = data.ibm_resource_group.rg.id
  create_timeout    = var.create_timeout
  update_timeout    = var.update_timeout
  delete_timeout    = var.delete_timeout
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name                  | Description                                                      | Type         | Default | Required |
|----------------------- |------------------------------------------------------------------|:-------------|:------- |:---------|
| at_service_name        | A descriptive name used to identify the activity tracker         | string       | n/a     | yes      |
| at_plan                | The name of the plan type supported by activity tracker.         | string       | n/a     | yes      |
| at_region              | Location to create the activity tracker instance.                | string       | n/a     | yes      |
| resource_group         | Name of the resource group                                       | string       | n/a     | yes      |
| at_bind_key            | Indicating that instance key should be bind to activity tracker  | bool         | false   | no       |
| at_create_instance     | Controls if Activity Tracker should be created                   | bool         | true    | no       |
|at_resource_key_name    | Name used to identify activity tracker resource key              | string       | empty   | no       |
| at_role                | Name of the user role for activity tacker key                    | string       | empty   | no       |
| at_tags                | Tags that should be applied to the activity tracker              | list(string) | n/a     | no       |
|at_resource_key_tags    | Tags that should be applied to the activity tracker key          | list(string) | n/a     | no       |
| at_parameters          | Arbitrary parameters to pass fot activity tracker                | map(string)  | n/a     | no       |
| logdna_service_name    | A descriptive name used to identify the logdna                   | string       | n/a     | yes      |
| logdna_plan            | The name of the plan type supported by logdna.                   | string       | n/a     | yes      |
| logdna_region          | Location to create the logdna instance.                          | string       | n/a     | yes      |
| logdna_bind_key        | Indicating that instance key should be bind to logdna            | bool         | false   | no       |
|logdna_create_instance  | Controls if logdna should be created                             | bool         | true    | no       |
|logdna_resource_key_name| Name used to identify logdna resource key                        | string       | empty   | no       |
| logdna_role            | Name of the user role for logdna key.                            | string       | empty   | no       |
| logdna_tags            | Tags that should be applied to the logdna                        | list(string) | n/a     | no       |
|logdna_resource_key_tags| Tags that should be applied to the logdna key                    | list(string) | n/a     | no       |
| logdna_parameters      | Arbitrary parameters to pass for logdna                          | map(string)  | n/a     | no       |
| sysdig_service_name    | A descriptive name used to identify the sysdig                   | string       | n/a     | yes      |
| sysdig_plan            | The name of the plan type supported by sysdig.                   | string       | n/a     | yes      |
| sysdig_region          | Location to create the sysdig instance.                          | string       | n/a     | yes      |
| sysdig_bind_key        | Indicating that instance key should be bind to sysdig            | bool         | false   | no       |
|sysdig_create_instance  | Controls if sysdig should be created                             | bool         | true    | no       |
|sysdig_resource_key_name| Name used to identify sysdig resource key                        | string       | empty   | no       |
| sysdig_role            | Name of the user role for sysdig key.                            | string       | empty   | no       |
| sysdig_tags            | Tags that should be applied to the sysdig                        | list(string) | n/a     | no       |
|sysdig_resource_key_tags| Tags that should be applied to the sysdig key                    | list(string) | n/a     | no       |
| sysdig_parameters      | Arbitrary parameters to pass for sysdig                          | map(string)  | n/a     | no       |
| create_timeout         | Timeout duration for create                                      | string       | n/a     | no       |
| update_timeout         | Timeout duration for update                                      | string       | n/a     | no       |
| delete_timeout         | Timeout duration for delete                                      | string       | n/a     | no       |

## Usage

To create an infrastructure run the following command

  `terraform apply -var-file="input.tfvars"`

Similarly to remove an infrastructure run the following command

   `terraform destroy -var-file="input.tfvars"`

## Timeout block

Same set of timeout values (create, update & delete) are applicable to all the observability resources present in root module. For example, say we configure create timeout as 90 mins then for sysdig, logdna and activity tracker create time out will be 90 mins for each.

We can set the create, update and delete timeouts as string. For e.g say we want to set 15 minutes timeout then the value should be "15m".


## NOTE

Functionality of adding a key to any observability instance (logdna, sysdig and activity tracker) is by default `false`, i.e, by default module will not attach a key to respective instance. To enable this functionality, configure the following arguments

```
To enable key attach on activity tracker

at_bind_key              : configure it to true (deafult false)

at_resource_key_name     : configure the name of the key by (deafult empty)

at_role                  : configure the user role (deafult empty)
```
```
To enable key attach on logdna

logdna_bind_key          : configure it to true (deafult false)

logdna_resource_key_name : configure the name of the key (deafult empty)

logdna_role              : configure the user role (deafult empty)

```
```
To enable key attach on sysdig monitoring

sysdig_bind_key          : configure it to true (deafult false)

sysdig_resource_key_name : configure the name of the key (deafult empty)

sysdig_role              : configure the user role (deafult empty)

```